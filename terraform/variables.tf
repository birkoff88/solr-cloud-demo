variable "project_id" {}
variable "credentials_file" {
  default = "./service-account.json"
}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "instance_name" {
  default = "solr-demo"
}
