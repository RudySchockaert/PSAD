﻿function Get-DSLastLDAPFilter {
    <#
    .SYNOPSIS
    Returns the last used LDAP filter.
    .DESCRIPTION
    Returns the last used LDAP filter. Good for learning or troubleshooting.
    .EXAMPLE
    PS> Get-DSLastLDAPFilter

    Displays the LDAP filter used in the last call to Get-DSObject.
    .LINK
    https://github.com/zloeber/PSAD
    .NOTES
    Author: Zachary Loeber
   #>
    [CmdletBinding()]
    param ()

    begin {
        $FunctionName = $MyInvocation.MyCommand.Name
        Write-Verbose "$($FunctionName): Begin."
    }
    process {
        return ($Script:LastSearchSetting).Filter
    }
}
