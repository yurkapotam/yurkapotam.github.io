param (
    [long]$amount = 0
    [string]$text = "TEXT"
)

cd textrep
$cur = ""
1..$amount | % {
    $cur += $text
}
$shaobj = [System.Security.Cryptography.SHA256]::Create()
$sha = $shaobj.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($cur))
$shaobj.Dispose()
$cur | Out-File -FilePath "${amount}/$([System.Convert]::ToHexString($sha)).txt"
$nums = Get-ChildItem ./ -Name
cd ..
$cur = ""
foreach ($i in $nums) {
    foreach ($j in (Get-ChildItem $i -Name)) {
        $cur += $i
        $cur += "/"
        $cur += $j
        $cur += "`n"
    }
}
$cur | Out-File -FilePath "textreps.txt"