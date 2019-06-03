class Instruction
{
    [string]$Sign
    [int]   $Number

    Instruction ([string]$Sign, [int]$Number)
    {
        $this.Sign = $Sign
        $this.Number = $Number
    }
}

[array]$Instructions = @()
(Get-Content .\files\day1input) -split " " | ForEach-Object {
    $Instructions += $_ #[Instruction]::new($_.Substring(0, 1), [int]$_.Substring(1))
}

# Part 1
$Frequency = 0
$Instructions | ForEach-Object { # Loop through each instruction
    $Frequency += [int]$_
}

Write-Host "< Day 1 Part 1 >"
Write-Host "End Frequency:" $Frequency
Write-Host

<# Part 2

[array]$FrequenciesReached = @()
$Frequency = 0
$RepeatedFrequency = 0
$ExitLoop = $false
while ($ExitLoop -eq $false) # Loop until repeat is found
{
        $Frequency += $Instructions[$i++ % $Instructions.Length]
        if ($FrequenciesReached.Contains($Frequency))
        {
            # Repeated frequency found
            $ExitLoop = $true
        }
        $FrequenciesReached += $Frequency
        Write-Host $Frequency # Debug
}

Write-Host "< Day 1 Part 2 >"
Write-Host "Repeated Frequency:" $RepeatedFrequency
Write-Host
#>