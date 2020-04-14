# .ExternalHelp authentication-help.xml
function Connect-Organization {
  [CmdletBinding(
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Connect-AzDevOpsOrganization.md#connect-azdevopsOrganization',
    PositionalBinding = $true)]
  [OutputType([String])]
  param (
    [Parameter(Mandatory = $true)]
    [string]$Orgname,
    [Parameter(Mandatory = $true)]
    [string]$PAT
  )

  $azDevOpsHeader = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($PAT)")) }
  $azDevOpsOrg = "https://dev.azure.com/$($Orgname)/"

  $uriProjects = $azDevOpsOrg + "_apis/projects?api-version=5.1"
  $Result = Invoke-RestMethod -Uri $uriProjects -Method get -Headers $azDevOpsHeader
  if ($Result.GetType().Name -ne 'String') {
    Set-Variable -Name azDevOpsHeader -Value $azDevOpsHeader -Scope Global
    Set-Variable -Name azDevOpsOrg -Value $azDevOpsOrg -Scope Global
    Set-Variable -Name azDevOpsConnected -Value $true -Scope Global
    return "Connected to $($azDevOpsOrg)"
  }
  else {
    $PSCmdlet.ThrowTerminatingError(
      [System.Management.Automation.ErrorRecord]::new(
        ([System.Net.WebSockets.WebSocketException]"Failed to connect to Azure DevOps, please check OrgName or Token"),
        'Authentication.Functions',
        [System.Management.Automation.ErrorCategory]::OpenError,
        $MyObject
      )
    )
  }
}
function Get-Operation {
  [CmdletBinding(
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Get-AzDevOpsOperation.md#get-azdevopsoperation',
    PositionalBinding = $true)]
    [OutputType([Object])]
  param (
    [Parameter(Mandatory = $true)]
    [Guid]$OperationId
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      $uriOperations = $Global:azDevOpsOrg + "_apis/operations/$($OperationId)?api-version=5.1"
      Invoke-RestMethod -Uri $uriOperations -Method Get -Headers $Global:azDevOpsHeader
    }
    else {
      $PSCmdlet.ThrowTerminatingError(
        [System.Management.Automation.ErrorRecord]::new(
          ([System.Management.Automation.ItemNotFoundException]"Not connected to Azure DevOps, please run Connect-AzDevOpsOrganization"),
          'Projects.Functions',
          [System.Management.Automation.ErrorCategory]::OpenError,
          $MyObject
        )
      )
    }
  }
  catch {
    throw $_
  }
}