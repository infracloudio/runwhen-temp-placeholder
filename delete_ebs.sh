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

if [[ "$EBS_VOLUME_EXISTS" != "None" ]]; then
    echo "Deleting EBS volume $EBS_VOLUME_EXISTS..."
    aws ec2 delete-volume --volume-id "$EBS_VOLUME_EXISTS" --region="us-west-2" --no-cli-pager
else 
    echo "No EBS volume with tag Name=ebs-test exists."
fi
