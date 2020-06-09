#powershell - Iron Scripter - Counting Challenge
#BEGINNER - 3 ways to sum even numbers from 1 - 100
#1
$beginnerSample1 = (1..100 | ?{($_ % 2) -eq 0} | Measure-Object -Sum).sum
write-host "Beginner Sample 1: $beginnerSample1" -ForegroundColor cyan

#2
$numArray = 1..100
$sum=0
foreach($num in $numArray){
    if(($num % 2) -eq 0){
        $sum+=$num
    }
}
write-host "Beginner Sample 2: $sum" -ForegroundColor Yellow

#3
$sum2=0
$i=100
while($i -ge 0){
    $sum2 += (100-$i)
    $i-=2
    
}
write-host "Beginner Sample 3: $sum2" -ForegroundColor Magenta


#INTERMEDIATE - Function that allows user to input start Number, End Number, and interval(i.e. "Every 5th number between 6 - 546")
function Count-Challenge {
    [CmdletBinding()]
    param(
    [int]$interval,
    [int]$endNumber,
    [int]$startNumber
    )
    if(($interval -lt 1) -or ($interval -gt 10)){
        write-host "Interval not within range of 1 - 10!" -ForegroundColor Red
        return
    }
   
    $numArray = ($startNumber)..($endNumber)
    #$value = $numArray | ?{($_ % $interval) -eq 0} | Measure-Object -sum -Average
    $value=@()
    $i = $startNumber
    $j = 1
    foreach($number in $numArray){
        if($j -eq $interval){
            $value += $number
            $j=1 
        }
        else{$j++}
    }
    $valueArray = $value | Measure-Object -sum -Average
    $valueArray = $valueArray | select *,@{n='Matching_Numbers';e={$value -join ','}} -ExcludeProperty Maximum, Minimum, Property
    $valueArray
    

}


Write-Host "`n`nFunction Example:" -ForegroundColor Green
write-host "Count-Challenge -startNumber 4 -endNumber 104 -interval 8" -ForegroundColor green
Count-Challenge -startNumber 4 -endNumber 104 -interval 8
