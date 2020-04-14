---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/New-AzDevOpsProject.md#new-azdevopsproject
schema: 2.0.0
---

# New-AzDevOpsProject

## SYNOPSIS
Queues a project to be created

## SYNTAX

```
New-AzDevOpsProject [-Name] <String> [[-Description] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function provides a way to quickly and easily create a new Azure Devops project. The Name parameter 
is currently the only required parameter.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AzDevOpsProject -Name TestProject -Description 'this is a new project'

id                                   status url
--                                   ------ ---
859ba28b-918b-4eaf-a819-b0024b9dd9e5 notSet https://dev.azure.com/patton-tech/_apis/operations/859ba28b-918b-4eaf-a819-b0024b9dd9e5
```

Creating a new project

## PARAMETERS

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
The project's description (if any).

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
Project name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

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

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[Connect-AzDevOpsOrganization](https://github.com/Azure-Devops-PowerShell-Module/authentication/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsorganization)

[Get-AzDevOpsOperation](https://github.com/Azure-Devops-PowerShell-Module/operations/blob/master/docs/Connect-AzDevOpsOrganization.md#get-azdevopsoperation)