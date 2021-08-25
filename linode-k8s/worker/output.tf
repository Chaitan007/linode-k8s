output "ip_address" {
    value = linode_instance.k8s-worker.*.ip_address
}
