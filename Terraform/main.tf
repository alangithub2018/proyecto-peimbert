provider "google" {
  project = "stps-360015"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_stps_instance" {
  name         = "terraform-instance"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  /*connection {
    type        = "ssh"
    user        = "mtywdm"
    timeout     = "500s"
    private_key = file(var.privatekeypath)
    host        = "34.135.246.3"
  }*/

  /*provisioner "file" {
    source = "data/script.sh"
    destination = "/tmp/init.sh"
  }

   provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh"
    ]
  }*/

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = "34.135.246.3"
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22-27023"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["web"]
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
