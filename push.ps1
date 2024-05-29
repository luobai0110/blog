function Push-ToGitHub {
    param (
        [datetime]$Date = (Get-Date)
    )
    
    # 确保在执行git命令之前，当前目录是Git仓库
    if (-not (Test-Path .\.git)) {
        Write-Error "当前目录不是一个Git仓库。"
        return
    }
    
    # 执行Git命令
    git pull
    git add .
    git commit -m "($Date -Format "yyyyMMdd HHmmss")"
    git push
}

Push-ToGitHub