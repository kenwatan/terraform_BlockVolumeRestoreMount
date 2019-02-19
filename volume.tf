resource "oci_core_volume" "datavolume" {
  count               = "${var.NumInstances}"
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.availability_domain - 1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "attact-tf-volume${count.index}"
  source_details {
    #Required
#    id = "${data.oci_core_volume_backups.test_volume_backups.id}"
    id = "${var.volume_backup_ocid}"
    type                   = "volumeBackup"
  }
}
