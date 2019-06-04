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