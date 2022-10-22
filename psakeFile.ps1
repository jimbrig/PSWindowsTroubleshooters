properties {
    # Set this to $true to create a module with a monolithic PSM1
    $PSBPreference.Build.CompileModule = $false
    $PSBPreference.Help.DefaultLocale = 'en-US'
    $PSBPreference.Test.OutputFile = 'out/testResults.xml'
    $PSBPreference.Build.CopyDirectories = @()

    # Publish settings
    if ($galleryApiKey) {
        $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
    }
}

task Default -depends Test

task Test -FromModule PowerShellBuild -minimumVersion '0.6.1'

# task Pester -FromModule PowerShellBuild -minimumVersion '0.6.1' -preaction { Remove-Module PSEdgeKeywords -ErrorAction SilentlyContinue }

task InstallAct {
    if (-not (Get-Command -Name act -CommandType Application -ErrorAction SilentlyContinue)) {
        if ($IsWindows) {
            choco install act-cli
        } elseif ($IsLinux) {
            curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
        } elseIf ($IsMacOS) {
            brew install nektos/tap/act
        }
    } else {
        'act already installed'
    }
}

task TestGHAction -depends Build, InstallAct  {
    act -j test -P ubuntu-latest=nektos/act-environments-ubuntu:18.04
}
