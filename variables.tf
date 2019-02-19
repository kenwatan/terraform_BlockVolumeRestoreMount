variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}

# Refer https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/managingkeypairs.htm on how to setup SSH key pairs for compute instances
variable "ssh_public_key" {}

variable "ssh_private_key" {}

variable "api_public_key" {
  default = "-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4fGHcxbEs3VaWoKaGUiPHGZ5ILiOXCcWN4nOgLr6CSzUjtgjmN3aA6rsT2mYiD+M5EecDbEUMectUhNtLl5LPABN9kpjuR0zxCJXvYYQiCBtdjb1/YxrZI9T/9Jtd+cTabCahJHR/cR8jFmvO4cKJCa/0+Y00zvktrqniHIn3edGAKC4Ttlwj/1NqT0ZVePMXg3rWHPsIW6ONfdn6FNfMet8Qa8K3C9xVvzImlYx8PQBy/44Ilu5T3A+puwb2QMeZnQZGDALOY4MvrBTTA1TdjFpg1NChj2rGYzreysqlnKFu+1qg64wel39kHkppz4Fv2vaLXF9qIeDjeo3G4sHQIDAQAB-----END PUBLIC KEY-----"
}

variable "NumInstances" {
  default = "1"
}

variable "instance_shape" {
  default = "VM.Standard2.1"
}
# Choose an Availability Domain
variable "availability_domain" {
  default = "2"
}

variable "TF_SubnetOCID" {
  default = "ocid1.subnet.oc1.iad.aaaaaaaaapjednwndavepxbmlhvjgsus7sq3jgdwyjb3h4g5fzhh3vd2wrrq"
}

variable "instance_image_ocid" {
  type = "map"

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.5-2018.05.09-1"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaazregkysspxnktw35k4r5vzwurxk6myu44umqthjeakbkvxvxdlkq"

    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaa6ybn2lkqp2ejhijhehf5i65spqh3igt53iyvncyjmo7uhm5235ca"
    uk-london-1  = "ocid1.image.oc1.uk-london-1.aaaaaaaayodsld656eh5stds5mo4hrmwuhk2ugin4eyfpgoiiskqfxll6a4a"
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaaozjbzisykoybkppaiwviyfzusjzokq7jzwxi7nvwdiopk7ligoia"
  }
}

variable "volume_backup_ocid" {
  default = "ocid1.volumebackup.oc1.iad.abuwcljtdmtyzcgzeu3pvhhch3sqvsxpqvuomul2fw5hoscqivhbaie5mera"
}
