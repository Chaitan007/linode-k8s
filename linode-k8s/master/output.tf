output "ip_address" {
    value = linode_instance.k8s-master.*.ip_address
}
