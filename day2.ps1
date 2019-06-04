$BoxIDs = (Get-Content .\files\day2input)

# Part 1
$TotalDoubleIDs = 0
$TotalTripleIDs = 0

$BoxIDs | ForEach-Object {
    $DoubleFound = $false # Used to mark incrementation
    $TripleFound = $false

    $_.ToCharArray() | Group-Object | ForEach-Object {
        if ($_.Count -eq 2) {$DoubleFound = $true}
        if ($_.Count -eq 3) {$TripleFound = $true}
    }

    # Added here to ensure the count isn't increased when multiple doubles exist per line
    if ($DoubleFound) {$TotalDoubleIDs++}
    if ($TripleFound) {$TotalTripleIDs++}
}

Write-Host "< Day 2 Part 1 >"
Write-Host "Checksum:" ($TotalDoubleIDs * $TotalTripleIDs)
Write-Host

# Part 2
$FirstID = ""
$SecondID = ""
$Differences = 0

# Find matching ID's
$BoxIDs | ForEach-Object {
    $ID = $_
    $BoxIDs | ForEach-Object {
        $CompareID = $_
        for ($i = 0; $i -lt $ID.length; $i++)
        {
            if ($ID[$i] -ne $CompareID[$i]) {$Differences++}
        }

        if ($Differences -eq 1)
        {
            $FirstID = $ID
            $SecondID = $CompareID
        }
        $Differences = 0
    }
}

# Remove extra char from matching ID's
for ($i = 0; $i -lt $ID.length; $i++)
{
    if ($FirstID[$i] -ne $SecondID[$i])
    {
        $CorrectID = $FirstID.Remove($i, 1)
        break
    }
}

Write-Host "< Day 2 Part 2 >"
Write-Host "Correct ID:" $CorrectID
Write-Host