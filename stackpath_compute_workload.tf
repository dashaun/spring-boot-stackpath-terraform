resource "stackpath_compute_workload" "javagrunt" {
  name = "bootiful${formatdate("DD_MMM_YYYY_hh_mm_ZZZ", timestamp())}"
  slug = "spring-boot-stackpath-terraform"
  labels = {
    role = "spring-boot"
  }
  network_interface {
    network = "default"
  }

  container {
    # Name that should be given to the container
    name = "bootiful"

    # Nginx image to use for the container
    image = "dashaun/spring-boot-native-pi-default:latest"
    #    image = "nginx:latest"

    port {
      name     = "http"
      port     = 8080
      protocol = "tcp"
      #      enable_implicit_network_policy = true
    }

    liveness_probe {
      tcp_socket {
        port = 8080
      }
      initial_delay_seconds = 5
      failure_threshold     = 3
      success_threshold     = 1
      period_seconds        = 60
    }

    # Override the command that's used to execute the container. If this option
    # is not provided the default entrypoint and command defined by the docker
    # image will be used.
    # command = []
    resources {
      requests = {
        "cpu"    = "2"
        "memory" = "4Gi"
      }
    }

    #    env {
    #      key   = "SERVER_PORT"
    #      value = "80"
    #    }
  }

  target {
    name         = "us"
    min_replicas = 1
    max_replicas = 1
    #    scale_settings {
    #      metrics {
    #        metric = "cpu"
    #        # Scale up when CPU averages 50%.
    #        average_utilization = 80
    #      }
    #    }
    # Deploy these 1 to 2 instances in Dallas, TX, USA and Amsterdam, NL.
    deployment_scope = "cityCode"
    selector {
      key      = "cityCode"
      operator = "in"
      values = [
        "DFW"
      ]
    }
  }
}
