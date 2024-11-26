param (
    [long]$amount = 0,
    [string]$text
)

cd textrep
$cur = ""
1..$amount | % {
    $cur += $text
}
$sha = [System.Text.Encoding]::UTF8.GetBytes($text)
mkdir $amount
$cur | Out-File -FilePath "${amount}/$([System.Convert]::ToHexString($sha)).txt"
$nums = Get-ChildItem ./ -Name -Directory
cd ..
$cur = ""
foreach ($i in $nums) {
    foreach ($j in (Get-ChildItem -Path ("textrep/" + $i) -Name)) {
        $cur += $i
        $cur += "/"
        $cur += $j
        $cur += "`n"
    }
}
$cur | Out-File -FilePath "textreps.txt"
