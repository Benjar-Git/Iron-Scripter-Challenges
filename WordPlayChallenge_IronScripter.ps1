# iron Scripter Word Play Challenge
# https://ironscripter.us/a-powershell-word-play-challenge/
#Ironscripter - Beginner Challenge
$w =  "Iron Scripter Beginner Test"
$z =  "Iron Scripter Intermediate Test"
$stringCharArray = [int[]][char[]]$w
$intString = $stringCharArray -join ' '
$sum=0
$stringCharArray | foreach{$sum+=$_}
$sumString = $sum

#intermediate Challenge
function ConvertTo-DoubleChar {
    [cmdletBinding()]
    param(
    [Parameter(ValueFromPipeline)][string]$input
    )
    $input = $input.ToString()
    $charString = ([int[]][char[]]$input | %{$_ * 2}) -join ' '
    ($charString.Split(' ') | %{[char][int]$_}) -join ''
}

function ConvertFrom-DoubleChar {
    [cmdletBinding()]
    param(
    [Parameter(ValueFromPipeline)][string]$input
    )
    $input = $input.ToString()
    $charString = ([int[]][char[]]$input | %{$_ / 2}) -join ' '
    ($charString.Split(' ') | %{[char][int]$_}) -join ''
}
$doubleCharString = $z | ConvertTo-DoubleChar
$roundTrip = $z | ConvertTo-DoubleChar | ConvertFrom-DoubleChar

write-host "Beginner - Sample String:"
write-host "'$w'" -ForegroundColor Yellow
write-host "Sum of Char:   $sumString" -ForegroundColor Cyan
write-host "Char String: $intString" -ForegroundColor Cyan

write-host "Intermediate - Sample String:"
write-host "'$z'" -ForegroundColor Yellow
write-host "Convert to Double Char string: $doubleCharString" -ForegroundColor Cyan
write-host "Round-Trip for Char string: $roundTrip" -ForegroundColor Cyan




