#!/bin/bash

zip_lambda_functions() {
    folder_names=("$@")
    for folder_name in "${folder_names[@]}"; do
        lambda_file="../lambdas/${folder_name}/lambda_function.py"
        zip_file="../lambdas/${folder_name}/${folder_name}.zip"
        zip -j "${zip_file}" "${lambda_file}"
    done
}

folders=("getCount" "updateCount")
zip_lambda_functions "${folders[@]}"