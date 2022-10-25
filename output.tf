output "bootiful" {
  value = {
    for instance in stackpath_compute_workload.javagrunt.instances :
    instance.name => {
      ip_address = instance.external_ip_address
      phase      = instance.phase
    }
  }
}

output "ip_address_0" {
  value = stackpath_compute_workload.javagrunt.instances[0].external_ip_address
}