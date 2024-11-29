enum savetype
{
    first
    second
    third
}

param (
    [string]$_savepath = "level.dat",
    [savetype]$savetype = [savetype]::first,
    [string]$mapname = "level.txt"
)

$savepath = if ($_savepath.EndsWith("/")) {$_savepath} else {$_savepath + "/"}

$cur =  "Map Name:$mapname`n"
$cur += "Map Type:1`n"
$cur += "Holo Sign:0.0, 0.0, 0.0*`n"
$cur += "Camera Pos:0.00, 0.00, 0.00:0.00, 0.00, 0.00`n"
$cur += "Max Vehicle Count: 16`n"
$cur += "Fuel Consume Rate: 2`n"
$cur += "Delete Idle Vehicle: -1`n"
$cur += "Health Regeneration: true`n"
$cur += "Hide Names: false`n"
$cur += "Allow Respawn: true`n"
$cur += "Voice-Chat: enabled`n"
$cur += "Vote For Role: disabled`n"
$cur += "Role-play: disabled`n"
$cur += "Approve On Register: false`n"
$cur += "Roles List:<color=yellow>[TAXI]</color>,<color=#C7C>[WORKER]</color>,[BUILDER],<color=green>[DOCTOR]</color>,<color=orange>[MECHANIC]</color>,<color=blue>[POLICE]</color>,<color=red>[ADMIN]</color>,`n"

switch ($savetype)
{
    [savetype]::first
    {
        $stream = New-Object System.IO.Compression.GZipStream @([System.IO.File]::OpenRead($_savepath), [System.IO.Compression.CompressionMode]::Decompress)
        $level = New-Object byte[] $stream.Length
        $stream.Read($level)
        $stream.Dispose()
        for ($x = 0; $x -lt 256; $x++)
        {
            for ($y = 0; $y -lt 64; $y++)
            {
                for ($z = 0; $z -lt 256; $z++)
                {
                    $id = $level[65536 * $y + 256 * $z + $x]
                    if ($id -ne 0) {$cur += "Block_Scalable_Editor:$($x * 2).00,$($y * 2).00,$($z * 2).00:0.00,0.00,0.00:2.00,2.00,2.00:color{1.00,1.00,1.00} material{${id},0.25}`n"}
                }
            }
        }

        $cur += "Downloadable_Content_Material|https://yurkapotam.github.io/mc_first/1.jpg`n"
        $cur += "Downloadable_Content_Material|https://yurkapotam.github.io/mc_first/2.jpg`n"

        $cur | Out-File -FilePath $_savepath
    }
}
