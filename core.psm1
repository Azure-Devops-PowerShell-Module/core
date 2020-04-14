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
function Get-Process {
  [CmdletBinding(
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Get-AzDevOpsProcess.md#get-azdevopsprocess',
    PositionalBinding = $true)]
  [OutputType([Object])]
  param (
    [Parameter(Mandatory = $false)]
    [Guid]$ProcessId
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      if ($ProcessId) {
        $uriProcess = $Global:azDevOpsOrg + "_apis/process/processes/$($ProcessId)?api-version=5.1"
        return (Invoke-RestMethod -Uri $uriProcess -Method get -Headers $Global:azDevOpsHeader)
      }
      else {
        $uriProcess = $Global:azDevOpsOrg + "_apis/process/processes?api-version=5.1"
        (Invoke-RestMethod -Uri $uriProcess -Method get -Headers $Global:azDevOpsHeader).Value
      }
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
function Get-Project {
  [CmdletBinding(
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/projects/blob/master/docs/Get-AzDevOpsProject.md#get-azdevopsproject',
    PositionalBinding = $true)]
    [OutputType([Object])]
  param (
    [Parameter(Mandatory = $false)]
    [Guid]$ProjectId
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      if ($ProjectId) {
        $uriProjects = $Global:azDevOpsOrg + "_apis/projects/$($ProjectId)?api-version=5.1"
        return (Invoke-RestMethod -Uri $uriProjects -Method get -Headers $Global:azDevOpsHeader)
      }
      else {
        $uriProjects = $Global:azDevOpsOrg + "_apis/projects?api-version=5.1"
        (Invoke-RestMethod -Uri $uriProjects -Method get -Headers $Global:azDevOpsHeader).Value
      }
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
function Get-ProjectProperty {
  [CmdletBinding(
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/projects/blob/master/docs/Get-AzDevOpsProjectProperty.md#get-azdevopsprojectproperty',
    PositionalBinding = $true)]
    [OutputType([Object])]
  param (
    [Parameter(ValueFromPipeline)]
    [object]$Project
  )

  process {
    $ErrorActionPreference = 'Stop'
    $Error.Clear()

    try {
      #
      # Are we connected
      #
      if ($Global:azDevOpsConnected) {
        $uriProjects = $Global:azDevOpsOrg + "_apis/projects/$($Project.id)/properties?api-version=5.1-preview.1"
        (Invoke-RestMethod -Uri $uriProjects -Method get -Headers $Global:azDevOpsHeader).Value
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
}
function New-Project {
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low',
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/New-AzDevOpsProject.md#new-azdevopsproject',
    PositionalBinding = $true)]
  [OutputType([Object])]
  param (
    [Parameter(Mandatory = $true)]
    [string]$Name,
    [Parameter(Mandatory = $false)]
    [string]$Description
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      $Body = @{
        "name"         = $Name
        "description"  = $Description
        "capabilities" = @{
          "versioncontrol"  = @{
            "sourceControlType" = "Git"
          }
          "processTemplate" = @{
            "templateTypeId" = "b8a3a935-7e91-48b8-a94c-606d37c3e9f2"
          }
        }
      } | ConvertTo-Json -Depth 5

      $uriProjects = $Global:azDevOpsOrg + "_apis/projects?api-version=5.1"
      if ($PSCmdlet.ShouldProcess("Create", "Create new project in $($Global:azDevOpsOrg) Azure Devops")) {
        $Result = Invoke-RestMethod -Uri $uriProjects -Method Post -Headers $Global:azDevOpsHeader -Body $Body -ContentType "application/json"
      }

      do {
        $Status = Get-AzDevOpsOperations -OperationId $Result.id
        Write-Verbose $Status.status
      } until ($Status.status -eq 'succeeded')

      Start-Sleep -Seconds 1
      Get-AzDevOpsProject | Where-Object -Property name -eq $Name
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
function Update-Project {
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium',
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Update-AzDevOpsProject.md#update-azdevopsproject',
    PositionalBinding = $true)]
  [OutputType([Object])]
  param (
    [Parameter(Mandatory = $false)]
    [string]$Name,
    [Parameter(Mandatory = $false)]
    [string]$Description,
    [Parameter(Mandatory = $true)]
    [object]$Project
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      $Body = @{
        "name"         = $Name
        "description"  = $Description
        "capabilities" = @{
          "versioncontrol"  = @{
            "sourceControlType" = "Git"
          }
          "processTemplate" = @{
            "templateTypeId" = "b8a3a935-7e91-48b8-a94c-606d37c3e9f2"
          }
        }
      } | ConvertTo-Json -Depth 5

      $uriProjects = $Global:azDevOpsOrg + "_apis/projects/$($Project.id)?api-version=5.1"
      if ($PSCmdlet.ShouldProcess("Modify", "Update $($Project.Name) values")) {
        Invoke-RestMethod -Uri $uriProjects -Method Patch -Headers $Global:azDevOpsHeader -Body $Body -ContentType "application/json"
      }
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
function Remove-Project {
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High',
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Remove-AzDevOpsProject.md#remove-azdevopsproject',
    PositionalBinding = $true)]
  [OutputType([String])]
  param (
    [Parameter(Mandatory = $true)]
    [object]$Project
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      $uriProjects = $Global:azDevOpsOrg + "_apis/projects/$($Project.id)?api-version=5.1"
      if ($PSCmdlet.ShouldProcess("Remove", "Delete $($Project.Name) from $($Global:azDevOpsOrg) Azure Devops")) {
        $Result = Invoke-RestMethod -Uri $uriProjects -Method Delete -Headers $Global:azDevOpsHeader
      }

      do {
        $Status = Get-AzDevOpsOperations -OperationId $Result.id
        Write-Verbose $Status.status
      } until ($Status.status -eq 'succeeded')

      return "Project $($Project.name) removed"
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
function Update-Project {
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium',
    HelpURI = 'https://github.com/Azure-Devops-PowerShell-Module/core/blob/master/docs/Update-AzDevOpsProject.md#update-azdevopsproject',
    PositionalBinding = $true)]
  param (
    [Parameter(Mandatory = $false)]
    [string]$Name,
    [Parameter(Mandatory = $false)]
    [string]$Description,
    [Parameter(Mandatory = $false)]
    [ValidateLength(3)]
    [string]$Abbreviation,
    [Parameter(Mandatory = $true)]
    [object]$Project
  )

  $ErrorActionPreference = 'Stop'
  $Error.Clear()

  try {
    #
    # Are we connected
    #
    if ($Global:azDevOpsConnected) {
      $Body = New-Object -TypeName psobject
      if ($Name) {Add-Member -InputObject $Body -MemberType NoteProperty -Name Name -Value $Name}
      if ($Description) {Add-Member -InputObject $Body -MemberType NoteProperty -Name Description -Value $Description}
      if ($Abbreviation) {Add-Member -InputObject $Body -MemberType NoteProperty -Name Abbreviation -Value $Abbreviation}
    
      $uriProjects = $Global:azDevOpsOrg + "_apis/projects/$($Project.id)?api-version=5.1"
      if ($PSCmdlet.ShouldProcess("Remove", "Delete $($Project.Name) from $($Global:azDevOpsOrg) Azure Devops")) {
        Invoke-RestMethod -Uri $uriProjects -Method Patch -Headers $Global:azDevOpsHeader -Body ($Body |ConvertTo-Json) -ContentType "application/json"
      }
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
