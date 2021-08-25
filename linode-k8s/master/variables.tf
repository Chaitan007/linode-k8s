variable "instance_label" {
   # type = string
    description = "Mention instance label"
    default = "default-linode"
  
}

variable "image_name" {
    type = string
    description = "Image name in linode"
    default = "linode/ubuntu20.04"
}

variable "root_password" {
    type = string
    description = "Root password for linode instance"
}


variable "region_name" {
    type = string
    description = "Region in linode"
    default = "eu-west"
  
}



variable "instance_count" {
    type = number
    description = "Number of instance to be create"
    default = 1
}

variable "instance_type" {
    type = string
    description = "Instance type in linode"
    default = "g6-standard-1"
    
}

variable "linode_token_key" {
    type = string
    description = "API token from linode"
    
}
