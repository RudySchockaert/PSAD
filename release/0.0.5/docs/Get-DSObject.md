﻿---
external help file: PSAD-help.xml
online version: https://github.com/zloeber/PSAD
schema: 2.0.0
---

# Get-DSObject

## SYNOPSIS
Get AD objects of any kind.

## SYNTAX

```
Get-DSObject [[-Identity] <String>] [[-ComputerName] <String>] [-Credential <PSCredential>] [-Limit <Int32>]
 [-SearchRoot <String>] [-Filter <String[]>] [-BaseFilter <String>] [-Properties <String[]>]
 [-PageSize <Int32>] [-SearchScope <String>] [-SecurityMask <String>] [-TombStone] [-ChangeLogicOrder]
 [-ModifiedAfter <DateTime>] [-ModifiedBefore <DateTime>] [-CreatedAfter <DateTime>]
 [-CreatedBefore <DateTime>] [-DontJoinAttributeValues] [-IncludeAllProperties] [-IncludeNullProperties]
 [-ExpandUAC] [-Raw] [-ResultsAs <String>]
```

## DESCRIPTION
Get AD objects of any kind.
Used by most other functions for AD retrieval.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
TBD
```

## PARAMETERS

### -Identity
Object to retreive.
Accepts distinguishedname, GUID, and samAccountName.

```yaml
Type: String
Parameter Sets: (All)
Aliases: User, Name, sAMAccountName, distinguishedName

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ComputerName
Domain controller to use for this search.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Server, ServerName

Required: False
Position: 2
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
Position: Named
Default value: $Script:CurrentCredential
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limits items retrieved.
If set to 0 then there is no limit.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: SizeLimit

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchRoot
Root of search.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
Custom LDAP filters for searches.
By default these are joined by logical AND.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BaseFilter
In addition to custom filters use this as an immutable filter for searches.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Properties
Properties to include in output.
Is not used if ResultsAs is set to directoryentry.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: @('Name','ADSPath')
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
Items returned per page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: $Script:PageSize
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchScope
Scope of a search as either a base, one-level, or subtree search, default is subtree.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: Subtree
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecurityMask
Specifies the available options for examining security information of a directory object.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TombStone
Whether the search should also return deleted objects that match the search filter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeLogicOrder
Use logical OR instead of AND in custom LDAP filtering

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModifiedAfter
Account was modified after this time

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModifiedBefore
Account was modified before this time

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreatedAfter
Account was created after this time

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreatedBefore
Account was created before this time

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DontJoinAttributeValues
Output will automatically join the attributes unless this switch is set.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAllProperties
Include all properties for an object.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeNullProperties
Include unset (null) properties as defined in the schema (with or without values).
This overrides the Properties parameter and can be extremely verbose.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpandUAC
Expands the UAC attribute into readable format.
Only effective if the ResultsAs parameter is psobject

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Raw
Skip attempts to convert known property types but still returns a psobject.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResultsAs
How the results are returned.
psobject (which includes interpretted properties), directoryentry, or searcher.
Default is psobject.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: Psobject
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Object

### System.DirectoryServices.DirectoryEntry

### System.DirectoryServices.DirectorySearcher

## NOTES
Author: Zachary Loeber

## RELATED LINKS

[https://github.com/zloeber/PSAD](https://github.com/zloeber/PSAD)

