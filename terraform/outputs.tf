output "solr_public_ip" {
  value = google_compute_instance.solr.network_interface[0].access_config[0].nat_ip
}
