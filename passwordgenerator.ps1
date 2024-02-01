$UpperChar = @("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
$LowerChar = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
$Numbers = @( "0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
$Symbols = @("`!", "`@", "`#", "`$", "`%", "`^", "`&", "`*", "(", ")", "`-", "`_", "`+", "`=", "`{", "`}", "`[", "`]", "`|", "`:", "`;", "`"", "`'", "`<", "`>", "`?", "`/")

[array]$Password = @()
#at least 12 character.
$RepeatCount = 3

for ($i = 0; $i -lt $RepeatCount; $i++) {

    $UpperCharShuffled = Get-Random -Shuffle $UpperChar 
    $GetIndexNumForUpperCase = Get-Random -Maximum $UpperChar.Length
    $Password += $UpperCharShuffled[$GetIndexNumForUpperCase]

    $LowerCharShuffled = Get-Random -Shuffle $LowerChar 
    $GetIndexNumForLowerCase = Get-Random -Maximum $LowerChar.Length
    $Password += $LowerCharShuffled[$GetIndexNumForLowerCase]

    $NumberShuffled = Get-Random -Shuffle $Numbers 
    $GetIndexNumForNumber = Get-Random -Maximum $Numbers.Length
    $Password += $NumberShuffled[$GetIndexNumForNumber]
    
    $SymbolsShuffled = Get-Random -Shuffle $Symbols 
    $GetIndexNumForSymbols = Get-Random -Maximum $Symbols.Length
    $Password += $SymbolsShuffled[$GetIndexNumForSymbols]
}

$Output = Get-Random -Shuffle $Password
[System.String]$PasswordOutput = ""
foreach ($currentItemName in $Output) {
    $PasswordOutput += $currentItemName
}
$DateTime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$Content = "$PasswordOutput - $DateTime"

$fileExists = Test-Path -Path "$env:USERPROFILE\Desktop\password.txt"
if (-not $fileExists) {
    $Content | Out-File -FilePath "$env:USERPROFILE\Desktop\password.txt"
}
if ($fileExists) {
    Add-Content -Path "$env:USERPROFILE\Desktop\password.txt" -Value $Content
}

Write-Host $PasswordOutput -ForegroundColor Green
 
