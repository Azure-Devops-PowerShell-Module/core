---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Update-AzDevOpsProject.md#update-azdevopsproject
schema: 2.0.0
---

# Update-AzDevOpsProject

## SYNOPSIS
Update Name, Description or Abbreviation of a project

## SYNTAX

```
Update-AzDevOpsProject [[-Name] <String>] [[-Description] <String>] [[-Abbreviation] <String>]
 [[-Project] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to update the Name or Description or Abbreviation of a 
given project within Azure DevOps.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AzDevOpsProject -ProjectId 2e6901c2-7cfb-40ea-901b-dfb439566e13 |Update-AzDevOpsProject -Name newproject


id             : 2e6901c2-7cfb-40ea-901b-dfb439566e13
name           : newproject
url            : https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13
state          : wellFormed
revision       : 515330771
_links         : @{self=; collection=; web=}
visibility     : private
defaultTeam    : @{id=cb24c842-7e32-4438-bf5d-fc67ac28a5c1; name=123abc Team; url=https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13/teams/cb24c842-7e32-4438-bf5d-fc67ac28a5c1}
lastUpdateTime : 2020-04-14T14:54:32.91Z
```

Changing the name of a project

### Example 2
```powershell
PS C:\> Get-AzDevOpsProject -ProjectId 2e6901c2-7cfb-40ea-901b-dfb439566e13 |Update-AzDevOpsProject -Name updatedproject -Description 'a new project description'


id             : 2e6901c2-7cfb-40ea-901b-dfb439566e13
name           : updatedproject
description    : a new project description
url            : https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13
state          : wellFormed
revision       : 515330772
_links         : @{self=; collection=; web=}
visibility     : private
defaultTeam    : @{id=cb24c842-7e32-4438-bf5d-fc67ac28a5c1; name=newproject Team; url=https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13/teams/cb24c842-7e32-4438-bf5d-fc67ac28a5c1}
```

Changing the name and description of a project

## PARAMETERS

### -Abbreviation
A 3 character project abbreviation

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
A descriptive name for the project

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
A name for the project

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Project
A project object as returned from Get-AzDevOpsProject

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[Connect-AzDevOpsOrganization](https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsorganization)

[Get-AzDevOpsOperation](https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Connect-AzDevOpsOrganization.md#get-azdevopsoperation)

[Get-AzDevOpsProject](https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Connect-AzDevOpsOrganization.md#get-azdevopsproject)