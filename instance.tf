resource "oci_core_instance" "TF_instance" {
  count               = "${var.NumInstances}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain - 1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "TF instances${count.index}"
  hostname_label      = "TFinstance${count.index}"
  shape               = "${var.instance_shape}"
  subnet_id           = "${var.TF_SubnetOCID}"

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid[var.region]}"
  }

  timeouts {
    create = "60m"
  }

}

