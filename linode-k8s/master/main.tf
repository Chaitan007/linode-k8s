terraform {
    required_providers {
       linode = {
          source = "linode/linode"
          version = "1.19.1"
        }
    }
}


provider "linode" {
    token = var.linode_token_key
  
}

#resource "linode_sshkey" "chaitan_key" {
#  label = "Chaitan_Key"
  # ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
#  ssh_key = var.public_key

#}

resource "linode_instance" "k8s-master" {
    count  = var.instance_count
    label = "k8s-master-${count.index + 1}"
    image = var.image_name
    region = var.region_name
    type = var.instance_type
    #authorized_keys = [linode_sshkey.chaitan_key.ssh_key]
    root_pass = var.root_password

    connection {
      type  = "ssh"
      host  = self.ip_address
      user  = "root"
      password = var.root_password
  }

    provisioner "file" {
      source = "master.sh"
      destination = "/tmp/master.sh"
    }

    provisioner "remote-exec" {
      inline = [
          "sudo swapoff -a",
          "chmod +x /tmp/master.sh",
          "/tmp/master.sh",
      ]
    
    }
   
}
