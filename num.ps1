param (
    [long]$amount = 0
)

cd num
$cur = ""
1..$amount | % {
    $cur += $_
    $cur += "`n"
}
$cur | Out-File -FilePath "${amount}.txt"
$nums = Get-ChildItem ./*.txt -Name
cd ..
$cur = ""
foreach ($i in $nums) {
    $cur += $i
    $cur += "`n"
}
$cur | Out-File -FilePath "nums.txt"
