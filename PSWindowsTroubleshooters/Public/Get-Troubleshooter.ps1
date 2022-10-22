
# source troubleshooters
# . "$PSScriptRoot\..\Data\Troubleshooters.psd1"

# $TroubleshooterKeys = @(
#     'NetworkDiagnosticsWeb'
#     'PrintDiagnostic'
#     'WindowsUpdateDiagnostic'
#     'WindowsStoreDiagnostic'
#     'PowerDiagnostic'
#     'WindowsMediaPlayerDiagnostic'
#     'AeroDiagnostic'
#     'WindowsDefenderDiagnostic'
#     'AudioRecordingDiagnostic'
#     'PCWDiagnostic'
#     'IESecurityDiagnostic'
#     'DeviceDiagnostic'
#     'SearchDiagnostic'
#     'AudioPlaybackDiagnostic'
#     'HomeGroupDiagnostic'
#     'NetworkDiagnosticsDA'
#     'NetworkDiagnosticFileShare'
#     'NetworkDiagnosticsInbound'
#     'IEDiagnostic'
#     'PerformanceDiagnostic'
#     'NetworkDiagnosticsNetWorkAdapter'
#     'MaintenanceDiagnostic'
# )

Function Get-Troubleshooter {
    <#
    .SYNOPSIS
        Get-Troubleshooter is a function that returns a list of troubleshooters that are available on the local machine.
    .DESCRIPTION
        Get-Troubleshooter is a function that returns a list of troubleshooters that are available on the local machine.
    .PARAMETER Name
        The name of the troubleshooter to return.
    .PARAMETER All
        Return all troubleshooters.
    .EXAMPLE
        Get-Troubleshooter

        Returns all troubleshooters.
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('WindowsUpdateDiagnostic','WindowsStoreDiagnostic','PowerDiagnostic','WindowsMediaPlayerDiagnostic','AeroDiagnostic','WindowsDefenderDiagnostic','AudioRecordingDiagnostic','PCWDiagnostic','IESecurityDiagnostic','DeviceDiagnostic','SearchDiagnostic','AudioPlaybackDiagnostic','HomeGroupDiagnostic','NetworkDiagnosticsDA','NetworkDiagnosticFileShare','NetworkDiagnosticsInbound','IEDiagnostic','PerformanceDiagnostic','NetworkDiagnosticsNetWorkAdapter','MaintenanceDiagnostic')]
        [string[]]$Name = $null,
        [Parameter(Mandatory = $false)]
        [switch]$All = $false
    )

        # [Parameter(Mandatory = $false)]
        # [ValidateSet('All','Windows','Apps','Hardware','Network','System')]
        # [string]$Category = 'All',
        # [Parameter(Mandatory = $false)]
        # # [ValidateSet({$TroubleshooterKeys})]
        # [string[]]$Include = $null,
        # [Parameter(Mandatory = $false)]
        # # [ValidateSet({$TroubleshooterKeys})]
        # [string[]]$Exclude = $null,


    Begin {
        $TroubleshootersAll = @{
            NetworkDiagnosticsDA = @{ID="NetworkDiagnosticsDA"; Command="$env:SystemRoot\system32\msdt.exe -id NetworkDiagnosticsDA"; Description="Troubleshoots problems connecting to a workplace network over the Internet using Direct Access."; Dependencies="Direct Access Installed"}
            DeviceDiagnostic = @{ID="DeviceDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id DeviceDiagnostic"; Description="Troubleshoots problems using hardware and access devices connected to the computer."; Dependencies=$null}
            HomeGroupDiagnostic = @{ID="HomeGroupDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id HomeGroupDiagnostic"; Description="Troubleshoots problems viewing computers or shared files in a homegroup."; Dependencies="HomeGroup Enabled"}
            NetworkDiagnosticsInbound = @{ID="NetworkDiagnosticsInbound"; Command="$env:SystemRoot\system32\msdt.exe -id NetworkDiagnosticsInbound"; Description="Troubleshoots problems with allowing other computers to communicate with the computer."; Dependencies=$null}
            NetworkDiagnosticsWeb = @{ID="NetworkDiagnosticsWeb"; Command="$env:SystemRoot\system32\msdt.exe -id NetworkDiagnosticsWeb"; Description="Troubleshoots problems connecting to the Internet or to a specific Web site."; Dependencies=$null}
            IEDiagnostic = @{ID="IEDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id IEDiagnostic"; Description="Troubleshoots problems with Internet Explorer. Helps the user prevent add-on problems and optimize temporary files and connections."; Dependencies="Internet Explorer installed"}
            IESecurityDiagnostic = @{ID="IESecurityDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id IESecurityDiagnostic"; Description="Troubleshoots problems with Internet Explorer security settings and helps the user prevent malware"; Dependencies="Internet Explorer installed"}
            NetworkDiagnosticsNetWorkAdapter = @{ID="NetworkDiagnosticsNetworkAdapter"; Command="$env:SystemRoot\system32\msdt.exe -id NetworkDiagnosticsNetworkAdapter"; Description="Troubleshoots problems with Network Adapters"; Dependencies=$null}
            PerformanceDiagnostic = @{ID="PerformanceDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id PerformanceDiagnostic"; Description="Troubleshoots problems with the performance of the computer."; Dependencies=$null}
            AudioPlaybackDiagnostic = @{ID="AudioPlaybackDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id AudioPlaybackDiagnostic"; Description="Troubleshoots problems with audio playback."; Dependencies=$null}
            PowerDiagnostic = @{ID="PowerDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id PowerDiagnostic"; Description="Troubleshoots problems with power settings."; Dependencies=$null}
            PrintDiagnostic = @{ID="PrintDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id PrintDiagnostic"; Description="Troubleshoots problems with printing."; Dependencies=$null}
            PCWDiagnostic = @{ID="PCWDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id PCWDiagnostic"; Description="Helps the user configure older programs so that they can run in the current version of Windows."; Dependencies=$null}
            AudioRecordingDiagnostic = @{ID="AudioRecordingDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id AudioRecordingDiagnostic"; Description="Troubleshoots problems with audio recording."; Dependencies=$null}
            SearchDiagnostic = @{ID="SearchDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id SearchDiagnostic"; Description="Troubleshoots problems with searching."; Dependencies=$null}
            WindowsUpdateDiagnostic = @{ID="WindowsUpdateDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id WindowsUpdateDiagnostic"; Description="Troubleshoots problems with Windows Update."; Dependencies=$null}
            WindowsStoreDiagnostic = @{ID="WindowsStoreDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id WindowsStoreDiagnostic"; Description="Troubleshoots problems with the Windows Store."; Dependencies=$null}
            WindowsDefenderDiagnostic = @{ID="WindowsDefenderDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id WindowsDefenderDiagnostic"; Description="Troubleshoots problems with Windows Defender."; Dependencies=$null}
            NetworkDiagnosticFileShare = @{ID="NetworkDiagnosticFileShare"; Command="$env:SystemRoot\system32\msdt.exe -id NetworkDiagnosticFileShare"; Description="Troubleshoots problems with file sharing."; Dependencies=$null}
            MaintenanceDiagnostic = @{ID="MaintenanceDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id MaintenanceDiagnostic"; Description="Troubleshoots problems with maintenance."; Dependencies=$null}
            WindowsMediaPlayerDiagnostic = @{ID="WindowsMediaPlayerDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id WindowsMediaPlayerDiagnostic"; Description="Troubleshoots problems with Windows Media Player."; Dependencies=$null}
            AeroDiagnostic = @{ID="AeroDiagnostic"; Command="$env:SystemRoot\system32\msdt.exe -id AeroDiagnostic"; Description="Troubleshoots problems with Aero."; Dependencies=$null}
        }

        # $TroubleshooterKeys = $TroubleshootersAll.Keys

    }

    Process {
        If ($null -eq $Name) {
            $Name = $TroubleshootersAll.Keys
            $SelectedTroubleshooters = $TroubleshootersAll
        }

        if ($All) {
            $SelectedTroubleshooters = $TroubleshootersAll
        }

        if ($Name) {
            $SelectedTroubleshooters = @{}
            foreach ($Troubleshooter in $Name) {
                $SelectedTroubleshooters.Add($Troubleshooter, $TroubleshootersAll[$Troubleshooter])
            }
        }
        # elseif ($Include) {
        #     $SelectedTroubleshooters = $TroubleshootersAll | Where-Object {$Include -contains $_.Key}
        # }
        # elseif ($Exclude) {
        #     $SelectedTroubleshooters = $TroubleshootersAll | Where-Object {$Exclude -notcontains $_.Key}
        # }
        # else {
        #     $SelectedTroubleshooters = $TroubleshootersAll[$Name]
        }

    End {
        [PSCustomObject]@{
            PSTypeName = "Troubleshooter"
            ID = @($SelectedTroubleshooters.Keys)
            Command = @(ForEach ($t in $SelectedTroubleshooters) { $t.Values.ForEach({$_.Command}) })
            Description = @(ForEach ($t in $SelectedTroubleshooters) { $t.Values.ForEach({$_.Description}) })
            Dependencies = @(ForEach ($t in $SelectedTroubleshooters) { $t.Values.ForEach({$_.Dependencies}) })
        }
    }
}


