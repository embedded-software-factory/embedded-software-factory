locals {
  version = "0.0.1"
}

build {
  name = "embedded-software-factory"

  sources = [
    "source.vagrant.alpine"
  ]

  provisioner "shell" {
    scripts = [
      "scripts/dependencies.sh",
    ]
    pause_before      = "10s"
    timeout           = "10s"
    execute_command   = "echo 'vagrant' | sudo -S -E sh -c '{{ .Vars }} {{ .Path }}'"
    expect_disconnect = true
  }

  provisioner "shell" {
    environment_vars = ["CONTAINER_RUNTIME=docker"]
    inline = [
      "curl -LO https://raw.githubusercontent.com/tektoncd/plumbing/main/hack/tekton_in_kind.sh",
      "chmod +x ./tekton_in_kind.sh",
      "./tekton_in_kind.sh"
    ]
    pause_before = "10s"
    timeout      = "10s"
  }
}

