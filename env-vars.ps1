### Substitute USERNAME-Lab to correct the path if not using Lab

### Substitute the OCIDs, fingerprints and keys with the correct ones for your environment

### Authentication details

$env:TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaa32rrayvn6zb4ensfpnzwqtn6ellu77n7bavqh62ycahkmnmzxvoq"

$env:TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaaft5qm7dd2hpe5ibaft4s7diyfh2ndwtnqab3sh2kzhg2ahxcyrtq"

$env:TF_VAR_fingerprint="fa:56:8a:e9:42:c8:8a:07:49:73:3c:ca:24:f7:7a:bf"

$env:TF_VAR_private_key_path="C:\work\Key\private.pem"


### Compartment

$env:TF_VAR_compartment_ocid="ocid1.compartment.oc1..aaaaaaaasnucvwmurobhfm3sie44s7s23vwblueg533wwg6223mm2dejuvtq"


### Public/private keys used on the instances

$env:TF_VAR_ssh_public_key = Get-Content C:\work\Key\id_rsa.pub -Raw

$env:TF_VAR_ssh_private_key = Get-Content C:\work\Key\id_rsa -Raw


### Region

$env:TF_VAR_region="us-ashburn-1"


### Check variables are set in PowerShell wth "dir env:"
#
#
