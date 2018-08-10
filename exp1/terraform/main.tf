resource "google_compute_instance" "default" {
  name         = "bitcoin-experiments"
  machine_type = "${var.instance_type}"
  zone         = "us-east1-b"

  tags = ["bitcoin"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
      size = 256
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = "${data.template_file.startup_script.rendered}"

  metadata {
    sshKeys = "${var.ssh_name}:${file("${var.ssh_key_path}")}"
  }
}

data "template_file" "startup_script" {
  template = "${file("${path.modukle}/startup_script.tpl")}"

  vars {
    version = "0.15.1"
  }
}
