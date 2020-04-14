---
external help file: core-help.xml
Module Name: core
online version: https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Get-AzDevOpsOperation.md#get-azdevopsoperation
schema: 2.0.0
---

# Get-AzDevOpsOperation

## SYNOPSIS
Gets an operation from the the operationId using the given pluginId.

## SYNTAX

```
Get-AzDevOpsOperation [-OperationId] <Guid> [<CommonParameters>]
```

## DESCRIPTION
Operations provide a way to monitor the process of an async task. This function gets an operation from the the operationId using the given pluginId. Some scenarios don't require a pluginId. If a pluginId is not included in the call then just the operationId will be used to find an operation.

https://docs.microsoft.com/en-us/rest/api/azure/devops/operations/operations?view=azure-devops-rest-5.1

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AzDevOpsOperations -OperationId 'c92521c2-5599-4a87-aec6-58afe7b14444'

id                                   status    url                                                                               _links
--                                   ------    ---                                                                               ------
c92521c2-5599-4a87-aec6-58afe7b14444 succeeded https://dev.azure.com/patton-tech/_apis/operations/c92521c2-5599-4a87-aec6-58afe7b14444 @{self=}
```

Get the status of a running operation

## PARAMETERS

### -OperationId
This is a GUID that is returned from some Post/Patch/Delete method

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES
You must be connected to an Azure DevOps project

## RELATED LINKS

[Connect-AzDevOpsOrganization](https://github.com/Azure-Devops-PowerShell-Module/authentication/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsorganization)