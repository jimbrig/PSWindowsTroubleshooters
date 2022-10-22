Function Invoke-TroubleShooter {
    <#
    .SYNOPSIS
        Invoke-TroubleShooter is a function that runs troubleshooters on the local machine.
    .DESCRIPTION
        Invoke-TroubleShooter is a function that runs troubleshooters on the local machine.
    .PARAMETER Name
        The name of the troubleshooter to run.
    .PARAMETER AsAdmin
        Run the troubleshooter as an administrator?
    .EXAMPLE
        Invoke-TroubleShooter -Name WindowsUpdateDiagnostic -AsAdmin

        Will invoke the Windows Update Diagnostic troubleshooter as Administrator.
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('WindowsUpdateDiagnostic','WindowsStoreDiagnostic','PowerDiagnostic','WindowsMediaPlayerDiagnostic','AeroDiagnostic','WindowsDefenderDiagnostic','AudioRecordingDiagnostic','PCWDiagnostic','IESecurityDiagnostic','DeviceDiagnostic','SearchDiagnostic','AudioPlaybackDiagnostic','HomeGroupDiagnostic','NetworkDiagnosticsDA','NetworkDiagnosticFileShare','NetworkDiagnosticsInbound','IEDiagnostic','PerformanceDiagnostic','NetworkDiagnosticsNetWorkAdapter','MaintenanceDiagnostic')]
        [string]$Name,
        [Parameter(Mandatory = $false)]
        [switch]$AsAdmin = $false
    )
    Begin {
        $Troubleshooter = Get-Troubleshooter -Name $Name
        Write-Host "Running Command: $($Troubleshooter.Command)" -ForegroundColor Cyan
    }

    Process {
        cmd.exe /c "$($Troubleshooter.Command)"
    }

    End {
        Write-Host "Troubleshooter $($Name) has completed." -ForegroundColor Green
    }

}
