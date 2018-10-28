$Array = @()
$Computers = Get-Content localhost.txt

Foreach ($Computer in $Computers)
{


    Foreach ($OS in $OSs)
    {
        $Result = "" | Select Computer,OS,Architecture
        $Result.Computer = $Computer
        $Result.OS = $OS.Caption
        $Result.Architecture = $OS.OSArchitecture
        $Array += $Result
    }
}

$Array | Out-Host
Read-Host -Prompt “Press Enter to exit”


