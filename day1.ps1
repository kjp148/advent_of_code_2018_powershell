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
    $Instructions += $_
}

# Part 1
$Frequency = 0
$Instructions | ForEach-Object { # Loop through each instruction
    $Frequency += [int]$_
}

Write-Host "< Day 1 Part 1 >"
Write-Host "End Frequency:" $Frequency
Write-Host

# Part 2

$FrequenciesReached = [System.Collections.Generic.HashSet[int]]::new()
$Frequency = 0
$i = 0
while ($FrequenciesReached.Add($Frequency)) # Loop until repeat is found
{
        $Frequency += $Instructions[$i++ % $Instructions.Length]
}

Write-Host "< Day 1 Part 2 >"
Write-Host "Repeated Frequency:" $Frequency
Write-Host