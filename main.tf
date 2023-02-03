data "local_file" "ssh_key" {
  filename = var.local_ssh_key
}

resource "google_compute_instance" "stemly" {
  name         = var.domain_name
  machine_type = var.machine_type

#  lifecycle {
#    prevent_destroy = true
#  }

  metadata = {
    ssh-keys = "terraform:${data.local_file.ssh_key.content}"
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
    }

  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.access_config.0.nat_ip
    user        = "terraform"
    private_key = file("~/.ssh/id_rsa")
  }

  tags = ["webports"]
  
}

resource "null_resource" "copy_file" {
  provisioner "local-exec" {
    command = "scp ${local.bucket_name}.json ${google_compute_instance.stemly.network_interface.0.access_config.0.nat_ip}:~/"
  }
}

resource "cloudflare_record" "stemly" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain_name
  value   = google_compute_instance.stemly.network_interface.0.access_config.0.nat_ip
  type    = "A"
  proxied = true
}


output "ip_address" {
  value = google_compute_instance.stemly.network_interface.0.access_config.0.nat_ip
}
