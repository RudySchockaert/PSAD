﻿function Get-DSExchangeFederation {
    <#
    .SYNOPSIS
    Retreives Exchange federations from active directory.
    .DESCRIPTION
    Retreives Exchange federations from active directory.
    .PARAMETER ComputerName
    Domain controller to use for this search.
    .PARAMETER Credential
    Credentials to use for connection to AD.
    .EXAMPLE
    PS> Get-DSExchangeTopology

    Returns Exchange federations found in the current forest.
    .NOTES
    Author: Zachary Loeber
    .LINK
    https://github.com/zloeber/PSAD
    #>
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [Alias('Server','ServerName')]
        [string]$ComputerName = $Script:CurrentServer,

        [Parameter(Position = 1)]
        [alias('Creds')]
        [Management.Automation.PSCredential]$Credential = $Script:CurrentCredential
    )

    begin {
        if ($Script:ThisModuleLoaded) {
            Get-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
        }
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."
        $DSParams = @{
            ComputerName = $ComputerName
            Credential = $Credential
        }

        $ExchangeConfig = @(Get-DSExchangeSchemaVersion @DSParams)
        if ($null -eq $ExchangeConfig) {
            # Exchange isn't in the environment
            Write-Verbose "$($FunctionName): No exchange environment found."
            return $null
        }
        $Props_ExchOrgs = @(
            'distinguishedName',
            'Name'
        )
        $Props_ExchFeds = @(
            'Name',
            'msExchFedIsEnabled',
            'msExchFedDomainNames',
            'msExchFedEnabledActions',
            'msExchFedTargetApplicationURI',
            'msExchFedTargetAutodiscoverEPR',
            'msExchVersion'
        )
        $ConfigNamingContext = (Get-DSConfigPartition @DSParams).distinguishedname
        $Path_ExchangeOrg = "LDAP://CN=Microsoft Exchange,CN=Services,$($ConfigNamingContext)"
        $ExchangeFederations = @()
    }

    end {
        if (Test-DSObjectPath -Path $Path_ExchangeOrg @DSParams) {
            $ExchOrgs = @(Get-DSObject -Filter 'objectClass=msExchOrganizationContainer' -SearchRoot $Path_ExchangeOrg -SearchScope:SubTree -Properties $Props_ExchOrgs @DSParams)

            ForEach ($ExchOrg in $ExchOrgs) {
                $ExchServers = @(Get-DSObject -Filter 'objectCategory=msExchExchangeServer' -SearchRoot $ExchOrg.distinguishedname -SearchScope:SubTree -Properties $Props_ExchServers  @DSParams)

                # Get all found Exchange federations
                $ExchangeFeds = @(Get-DSObject -Filter 'objectCategory=msExchFedSharingRelationship' -SearchRoot "LDAP://CN=Federation,$([string]$ExchOrg.distinguishedname)" -SearchScope:SubTree -Properties $Props_ExchFeds)
                Foreach ($ExchFed in $ExchangeFeds) {
                    New-Object -TypeName psobject -Property @{
                        Organization = $ExchOrg.Name
                        Name = $ExchFed.Name
                        Enabled = $ExchFed.msExchFedIsEnabled
                        Domains = @($ExchFed.msExchFedDomainNames)
                        AllowedActions = @($ExchFed.msExchFedEnabledActions)
                        TargetAppURI = $ExchFed.msExchFedTargetApplicationURI
                        TargetAutodiscoverEPR = $ExchFed.msExchFedTargetAutodiscoverEPR
                        ExchangeVersion = $ExchFed.msExchVersion
                    }
                }
            }
        }
        else {
            Write-Warning "$($FunctionName): Exchange found in schema but nothing found in services path - $Path_ExchangeOrg"
            return $null
        }
    }
}
