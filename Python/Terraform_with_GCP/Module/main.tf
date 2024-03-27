provider "google" {
  project     = "ringed-hallway-417305"
  region      = "us-east1-b"
}

module "networking" {
source = "./networking"
}
