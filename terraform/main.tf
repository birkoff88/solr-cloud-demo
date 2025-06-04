resource "google_compute_instance" "solr" {
  name         = var.instance_name
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }


    metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/solr-key.pub")}"
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker

    docker run -d --name solr -p 8983:8983 solr
    docker run -d --name node-exporter -p 9100:9100 prom/node-exporter
  EOT

  tags = ["solr-demo"]
}

resource "google_compute_firewall" "solr_firewall" {
  name    = "solr-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "8983", "9100","3000", "9090"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["solr-demo"]
}
