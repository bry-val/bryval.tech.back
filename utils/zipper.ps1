function Zip-LambdaFunctions {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$folderNames
    )

    foreach ($folderName in $folderNames) {
        $lambda_file = "..\lambdas\$folderName\lambda_function.py"
        $lambda_dir = Split-Path -Parent $lambda_file
        $zip_file = "..\lambdas\$folderName\$folderName.zip"
        Compress-Archive -Path $lambda_file -DestinationPath $zip_file -Force
    }
}

$folders = @("getCount", "updateCount")
Zip-LambdaFunctions -folderNames $folders
