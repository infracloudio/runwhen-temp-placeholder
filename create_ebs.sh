#!/bin/bash

# GIT_TLD=`git rev-parse --show-toplevel`


EBS_VOLUME_EXISTS=$(
    aws ec2 describe-volumes \
    --filters Name=tag:Name,Values=ebs-test \
    --query 'Volumes[0].VolumeId' \
    --region="us-west-2" \
    --output text \
    --no-cli-pager
)


if [[ "$EBS_VOLUME_EXISTS" == "None" ]]; then
    aws ec2 create-volume --region="us-west-2" --availability-zone="us-west-2a" --size="1" --no-encrypted  --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=ebs-test}]'
else 
    echo "$EBS_VOLUME_EXISTS ebs already exists"
fi