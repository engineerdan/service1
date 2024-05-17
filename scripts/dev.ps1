Function up-s3{
    & $PSScriptRoot\resources\s3.ps1 | out-null
}

Function up-cognito{
    & $PSScriptRoot\resources\cognito.ps1 | out-null
}

Function up-eventbridge{
    & $PSScriptRoot\resources\eventbridge.ps1 | out-null
}

Function build-frontend{
    & $PSScriptRoot\util\build.ps1 | out-null
}

Function sync-frontend{
    & $PSScriptRoot\util\sync_frontend.ps1 | out-null
}

Function teardown-s3{
    & $PSScriptRoot\resources\s3_destroy.ps1
}

Function teardown-cognito{
    & $PSScriptRoot\resources\cognito_destroy.ps1
}

Function teardown-eventbridge{
    & $PSScriptRoot\resources\eventbridge_destroy.ps1
}

switch ($args[0]) {
    "--up" {
        up-s3
        up-cognito
        up-eventbridge
        build-frontend
        sync-frontend
    }

    "--up-s3" {
        # create S3 resources
        up-s3
    }

    "--up-cognito" {
        # create cognito resources
        up-cognito
    }

    "--up-eventbridge" {
        # create eventbridge resources
        up-eventbridge
    }

    "--up-users" {
        # create test user
    }

    "--build-frontend" {
        # build frontend
        build-frontend
    }

    "--sync-frontend" {
        # sync frontend to S3
        sync-frontend
    }

    "--sync-services" {
        # sync services to lambda
        # to do...
    }

    "--teardown" {
        teardown-s3
        teardown-cognito
        teardown-eventbridge
    }

    "--teardown-s3" {
        # tear down S3 resources
        teardown-s3
    }

    "--teardown-cognito" {
        # tear down cognito resources
        teardown-cognito
    }

    "--teardown-eventbridge" {
        # tear down eventbridge resources
        teardown-eventbridge
    }

    Default {
        "Please enter a valid argument."
    }
}