---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/projects/blob/master/docs/Get-AzDevOpsProject.md#get-azdevopsproject
schema: 2.0.0
---

# Get-AzDevOpsProject

## SYNOPSIS
Get one or many projects from Azure DevOps

## SYNTAX

```
Get-AzDevOpsProject [[-ProjectId] <Guid>] [<CommonParameters>]
```

## DESCRIPTION
Get project with the specified id or name, optionally including capabilities.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AzDevOpsProject


id             : 2a05695a-6070-466d-b723-a120c4f88455
name           : armtemplates
url            : https://dev.azure.com/patton-tech/_apis/projects/2a05695a-6070-466d-b723-a120c4f88455
state          : wellFormed
revision       : 515330637
visibility     : private
lastUpdateTime : 2019-08-07T21:12:39.607Z

id             : 0ae813fc-4ea2-4c9c-a187-c2e3b5dad5e4
name           : Scripts
description    : A collection of scripts for wiring Azure resources together
url            : https://dev.azure.com/patton-tech/_apis/projects/0ae813fc-4ea2-4c9c-a187-c2e3b5dad5e4
state          : wellFormed
revision       : 515330585
visibility     : private
lastUpdateTime : 2018-08-07T05:20:32.75Z
```

Get all available projects

### Example 2
```powershell
PS C:\> Get-AzDevOpsProject -ProjectId 2e6901c2-7cfb-40ea-901b-dfb439566e13


id             : 2e6901c2-7cfb-40ea-901b-dfb439566e13
name           : sample
url            : https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13
state          : wellFormed
revision       : 515330550
_links         : @{self=; collection=; web=}
visibility     : private
defaultTeam    : @{id=cb24c842-7e32-4438-bf5d-fc67ac28a5c1; name=sample Team; url=https://dev.azure.com/patton-tech/_apis/projects/2e6901c2-7cfb-40ea-901b-dfb439566e13/teams/cb24c842-7e32-4438-bf5d-fc67ac28a5c1}
lastUpdateTime : 2015-08-13T01:10:08.653Z
```

Get a single project

## PARAMETERS

### -ProjectId
Project identifier

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[Connect-AzDevOpsOrganization](https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsorganization)