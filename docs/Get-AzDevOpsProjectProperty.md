---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/projects/blob/master/docs/Get-AzDevOpsProjectProperty.md#get-azdevopsprojectproperty
schema: 2.0.0
---

# Get-AzDevOpsProjectProperty

## SYNOPSIS
Get a collection of team project Property

## SYNTAX

```
Get-AzDevOpsProjectProperty [[-Project] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Get a collection of team project Property

## EXAMPLES

### Example 1
```powershell
PS C:\> $Project = Get-AzDevOpsProject -ProjectId 2e6901c2-7cfb-40ea-901b-dfb439566e13

Get-AzDevOpsProjectProperty -Project $Project

name                                         value
----                                         -----
System.CurrentProcessTemplateId              7c062e8f-ae74-44c9-8f7d-9f3b35a73af1
System.Microsoft.TeamFoundation.Team.Default cb24c842-7e32-4438-bf5d-fc67ac28a5c1
System.MSPROJ                                <?xml version="1.0" encoding="utf-8"?>...
System.OriginalProcessTemplateId             55ac9c6a-2a5d-4567-9471-8659f826fe12
System.Process Template                      Microsoft Visual Studio Scrum 2013
System.ProcessTemplateType                   6b724908-ef14-45cf-84f8-768b5384da45
System.SourceControlCapabilityFlags          2
System.SourceControlGitEnabled               True
```

Get all Property from a specific project

### Example 1
```powershell
PS C:\> Get-AzDevOpsProject -ProjectId d5cf30dd-c965-43f3-9f4e-3dce76ed226a |Get-AzDevOpsProjectProperty

name                                          value
----                                          -----
System.CurrentProcessTemplateId               330f7e99-d497-42eb-9fcd-8f8fec59bc13
System.OriginalProcessTemplateId              330f7e99-d497-42eb-9fcd-8f8fec59bc13
System.ProcessTemplateType                    adcc42ab-9882-485e-a3ed-7678f01f66bc
System.MSPROJ                                 <?xml version="1.0" encoding="utf-8"?>...
System.Process Template                       Agile
System.Microsoft.TeamFoundation.Team.Default  49cf33f8-4c32-4fa2-aa67-b8b49a873ea6
System.SourceControlCapabilityFlags           2
System.SourceControlGitEnabled                True
System.SourceControlGitPermissionsInitialized True
```

Passing a project by pipeline

## PARAMETERS

### -Project
This is a project as returned from Get-AzDevOpsProject

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
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

[Get-AzDevOpsProject](https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Get-AzDevOpsProject.md#get-azdevopsproject)