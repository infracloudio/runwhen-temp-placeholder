import pulumi
import pulumi_aws as aws 

# Un-attached Volume
# Unencrypted Volume
# Aged Volume

ebs = aws.ebs.Volume(resource_name="ebs", encrypted=False, size=1, availability_zone="us-west-2a", tags={Name: "ebs-test"})
pulumi.export("ebs_name", ebs.id)