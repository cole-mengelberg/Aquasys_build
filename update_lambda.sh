#!/bin/bash
FUNCTION_NAME="aquasys-text-extract"
IMAGE_URI=$(cat imageDetail.json | jq -r '.ImageURI')

if aws lambda get-function --function-name $FUNCTION_NAME &> /dev/null; then
    echo "Updating existing Lambda function..."
    aws lambda update-function-code --function-name $FUNCTION_NAME --image-uri $IMAGE_URI
else
    echo "Creating new Lambda function..."
    aws lambda create-function --function-name $FUNCTION_NAME --package-type Image --code ImageUri=$IMAGE_URI --role your-lambda-execution-role-arn
fi
