#!/bin/bash

# Change BUCKET_NAME to a bucket you own for use by CloudFormation
#----- Change these parameters to suit your environment -----#
BUCKET_NAME=<ADD-YOUR-TEMPLATE-BUCKET-NAME>
STACK_NAME=lambda-set-cloudwatch-logs-retention
AWS_PROFILE=<AWS-PROFILE_NAME>

aws cloudformation package \
    --template-file template.yaml \
    --s3-bucket $BUCKET_NAME \
    --output-template-file packaged-template.yaml

aws cloudformation deploy \
    --profile "${AWS_PROFILE}" \
    --template-file packaged-template.yaml \
    --stack-name $STACK_NAME \
    --capabilities CAPABILITY_IAM
