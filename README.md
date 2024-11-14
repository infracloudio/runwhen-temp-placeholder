### Setup test bed for ebs codebundle

```sh
make create-ebs-volume
```

Clean once test is done
```sh
make delete-ebs-volume
```

## Cloud custodian

### Install Linux:

```sh
python3 -m venv custodian
source $HOME/custodian/bin/activate
pip install c7n 
```

`/policies` folder holding related yaml files.

The policy is validated automatically when you run it, but you can also validate it separately:

```sh
custodian validate ./policies/example.yml
```

You can also check which resources are identified by the policy without running any actions on the resources:

```sh
custodian run --dryrun -s . ./policies/example.yml
```