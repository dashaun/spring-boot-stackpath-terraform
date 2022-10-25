resource "stackpath_compute_network_policy" "bootiful" {
  name        = "Allow HTTP traffic to web servers"
  slug        = "web-servers-allow-http"
  description = "A network policy that allows HTTP access to instances with the web server role"
  priority    = 20000

  # Apply this network policy to every workload instance on the stack with the
  # "web-server" role. Instance selectors can also use any labels present on
  # workloads or instances in the stack.
  instance_selector {
    key      = "role"
    operator = "in"
    values   = ["spring-boot"]
  }

  # Apply this network policy to specific workload instances. Use the key
  # "workload.platform.stackpath.net/workload-slug" to target instances by slug
  # or use the key "workload.platform.stackpath.net/workload-id" to target
  # instances by ID.
  #
  # Use the priority value 65534 to define multiple workload-specific policies
  # to avoid priority collisions.
  instance_selector {
    key      = "workload.platform.stackpath.net/workload-slug"
    operator = "in"
    values   = ["spring-boot-stackpath-terraform"]
  }

  policy_types = ["INGRESS"]

  ingress {
    action      = "ALLOW"
    description = "Allow port 8080 traffic from all IPs"
    protocol {
      tcp {
        destination_ports = [8080]
      }
    }
    from {
      ip_block {
        cidr = "0.0.0.0/0"
      }
    }
  }
}