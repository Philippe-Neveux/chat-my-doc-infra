resource "google_compute_address" "gpu_vm_static_ip" {
  count = 2
  name  = "${var.vm_names[count.index]}-static-ip"
}

resource "google_compute_instance" "gpu_vm" {
  count        = 2
  name         = var.vm_names[count.index]
  machine_type = "n2-highmem-4"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20250805"
      size  = 100
      type  = "pd-standard"
    }
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.gpu_vm_static_ip[count.index].address
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  tags = ["gpu-vm", "allow-ssh"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-gpu-vms"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}