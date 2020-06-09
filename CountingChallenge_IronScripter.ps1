#powershell - Iron Scripter - Counting Challenge
#BEGINNER - 3 ways to sum even numbers from 1 - 100
#1
(1..100 | ?{($_ % 2) -eq 0} | Measure-Object -Sum).sum

#2
$numArray = 1..100
$sum=0
foreach($num in $numArray){
    if(($num % 2) -eq 0){
        $sum+=$num
    }
}
$sum

#3
$sum2=0
$i=100
while($i -ge 0){
    $sum2 += (100-$i)
    $i-=2
    
}
$sum2


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
