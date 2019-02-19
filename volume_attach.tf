resource "oci_core_volume_attachment" "backup_volume_attachments" {
  depends_on = ["oci_core_instance.TF_instance",
  "oci_core_volume.datavolume",
  ]
  count           = "${var.NumInstances}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.TF_instance.*.id[count.index]}"
  volume_id       = "${oci_core_volume.datavolume.*.id[count.index]}"

    connection {
      agent       = false
      timeout     = "15m"
      host        = "${oci_core_instance.TF_instance.*.public_ip[count.index % var.NumInstances]}"
      user        = "opc"
      private_key = "${var.ssh_private_key}"
    }

  # register and connect the iSCSI block volume
  provisioner "remote-exec" {
    inline = [
      "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
      "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
    ]
  }

  # initialize partition and file system
  provisioner "remote-exec" {
    inline = [
      "sudo systemctl start ocid.service",
      "set -x",
      "export DEVICE_ID=ip-${self.ipv4}:${self.port}-iscsi-${self.iqn}-lun-1",
      "sudo mkdir -p /mnt/vol01",
      "export UUID=$(sudo /usr/sbin/blkid -s UUID -o value /dev/sdb1)",
      "echo 'UUID='$${UUID}' /mnt/vol01 xfs defaults,_netdev,nofail 0 2' | sudo tee -a /etc/fstab",
      "sudo mount -a",
    ]
  }

  # unmount and disconnect on destroy
  provisioner "remote-exec" {
    when       = "destroy"
    on_failure = "continue"

    inline = [
      "set -x",
      "export DEVICE_ID=ip-${self.ipv4}:${self.port}-iscsi-${self.iqn}-lun-1",
      "export UUID=$(sudo /usr/sbin/blkid -s UUID -o value /dev/sdb1)",
      "sudo umount /mnt/vol01",
      "if [[ $UUID ]] ; then",
      "  sudo sed -i.bak '\\@^UUID='$${UUID}'@d' /etc/fstab",
      "fi",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -u",
      "sudo iscsiadm -m node -o delete -T ${self.iqn} -p ${self.ipv4}:${self.port}",
    ]
  }

}