
switch ($args[0]) {
    "dev" {
        & $PSScriptRoot\dev.ps1 $args[1..($args.length)]
    }
    "prod" {
        Write-Host "To do.."
    }
    Default {
        "First argument should be 'dev' or 'prod'."
    }
}

