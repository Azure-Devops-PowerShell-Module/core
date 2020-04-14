---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Remove-AzDevOpsTeam.md#remove-azdevopsteam
schema: 2.0.0
---

# Remove-AzDevOpsTeam

## SYNOPSIS
Delete a team.

## SYNTAX

```
Remove-AzDevOpsTeam [-ProjectId] <Guid> [-TeamId] <Guid> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to remove a team from an Azure Devops Project

## EXAMPLES

### Example 1
```powershell
PS C:\> Remove-AzDevOpsTeam -ProjectId d5cf30dd-c965-43f3-9f4e-3dce76ed226a -TeamId 9a305dd2-d928-44ab-84bf-03ccaa9b54c4

Confirm
Are you sure you want to perform this action?
Performing the operation "Remove team a whole new team from 123456-CustomerAccount Azure Devops Projects" on target "Delete".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
```

Removing a team from a project

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

### -ProjectId
A Project Id

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamId
A Team Id

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
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

### None

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

[Connect-AzDevOpsOrganization](https://github.com/Azure-Devops-PowerShell-Module/authentication/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsorganization)

[Get-AzDevOpsProject](https://github.com/Azure-Devops-PowerShell-Module/projects/blob/master/docs/Get-AzDevOpsProject.md#Get-azdevopsproject)

[Get-AzDevOpsTeam](https://github.com/Azure-Devops-PowerShell-Module/teams/blob/master/docs/Get-AzDevOpsTeam.md#get-azdevopsteam)