provider "google" {
  project = "bitcoin-experiments"
  region = "us-east1"
}

variable "instance_type" {
  type = "string"
  default = "n1-highcpu-4"
}

variable "ssh_name" {
  type = "string"
  default = "dcardoza"
}

variable "ssh_key_path" {
  type = "string"
  default = "~/.ssh/id_rsa.pub"
}
