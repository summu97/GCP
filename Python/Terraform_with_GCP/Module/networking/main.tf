resource "google_project_service" "dns" {
  project = "ringed-hallway-417305"

  service = "dns.googleapis.com"
}

resource "google_compute_network" "custom_network" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev" {
  name          = "dev-subnet"
  region        = "us-central1"
  network       = google_compute_network.custom_network.self_link
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "test" {
  name          = "test-subnet"
  region        = "us-central1"
  network       = google_compute_network.custom_network.self_link
  ip_cidr_range = "10.0.2.0/24"
}
resource "google_compute_firewall" "web-Http-ssh" {
  name    = "tcp-22-80"
  network = google_compute_network.custom_network.self_link

  # Allow rules
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
  
  allow {
    protocol = "icmp"
  }

  target_tags = ["web-server"]  # Apply to VMs with this tag
  source_ranges = ["0.0.0.0/0"]  # Allow traffic from any source
}

resource "google_compute_firewall" "app-ssh" {
  name    = "tcp-22"
  network = google_compute_network.custom_network.self_link

  # Allow rules
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  allow {
    protocol = "icmp"
  }

  target_tags = ["app-server"]  # Apply to VMs with this tag
  source_ranges = ["0.0.0.0/0"]  # Allow traffic from any source
}

output "network_self_link" {
  value = google_compute_network.custom_network.self_link
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.dev.self_link
}
