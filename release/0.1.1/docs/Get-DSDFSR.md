﻿---
external help file: PSAD-help.xml
online version: https://github.com/zloeber/psad
schema: 2.0.0
---

# Get-DSDFSR

## SYNOPSIS
Retreives the DFSR AD information

## SYNTAX

```
Get-DSDFSR [[-ComputerName] <String>] [[-Credential] <PSCredential>]
```

## DESCRIPTION
Retreives the DFSR AD information

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-DSDFSR
```

Returns the DFSR information found in the current forest

## PARAMETERS

### -ComputerName
Domain controller to use for this search.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Server, ServerName

Required: False
Position: 1
Default value: $Script:CurrentServer
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credentials to use for connection to AD.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: Creds

Required: False
Position: 2
Default value: $Script:CurrentCredential
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Returns DFSR information as defined in AD which may not align with reality.

## RELATED LINKS

[https://github.com/zloeber/psad](https://github.com/zloeber/psad)

