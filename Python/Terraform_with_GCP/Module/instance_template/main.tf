NOTE: when you are playing with template make sure your main.tf file have the same code because when you are defining to take values from other modules, it means you are creating resources from that modules.if you ignored this and run the normal way it will throw 409 error.
----------------------------------------------
provider "google" {
  project     = "ringed-hallway-417305"
  region      = "us-east1-b"
}


module "temp-1" {
source = "./temp-1"
}
