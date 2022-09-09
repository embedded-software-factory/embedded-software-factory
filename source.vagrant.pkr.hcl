source "vagrant" "alpine" {
  communicator = "ssh"
  source_path  = "generic/alpine316"
  provider     = "virtualbox"
  add_force    = true
  box_name     = "embedded-software-factory"
  output_dir   = "vagrant"
}

