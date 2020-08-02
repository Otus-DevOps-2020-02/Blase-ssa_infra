# module "gce-lb-http" {
#   source      = "github.com/GoogleCloudPlatform/terraform-google-lb-http"
#   name        = "group-http-lb"
#   target_tags = ["reddit-app"]
#   project     = var.project
#   backends = {
#     default = {
#       description                     = null
#       protocol                        = "HTTP"
#       port                            = var.service_port
#       port_name                       = "puma-service-port"
#       timeout_sec                     = 10
#       connection_draining_timeout_sec = null
#       enable_cdn                      = false
#       session_affinity                = null
#       affinity_cookie_ttl_sec         = null
#       health_check = {
#         check_interval_sec  = null
#         timeout_sec         = null
#         healthy_threshold   = null
#         unhealthy_threshold = null
#         request_path        = "/"
#         port                = var.service_port
#         host                = null
#         logging             = null
#       }

#       log_config = {
#         enable      = true
#         sample_rate = 1.0
#       }
#       groups = [
#         {
#           # Each node pool instance group should be added to the backend.
#           group                        = null #var.backend
#           balancing_mode               = null
#           capacity_scaler              = null
#           description                  = null
#           max_connections              = null
#           max_connections_per_instance = null
#           max_connections_per_endpoint = null
#           max_rate                     = null
#           max_rate_per_instance        = null
#           max_rate_per_endpoint        = null
#           max_utilization              = null
#         },
#       ]
#     }
#   }


#   # #   backends          = {
#   # #     "0" = [
#   # #       { group = module.mig1.instance_group },
#   # #       { group = module.mig2.instance_group }
#   # #     ],
#   # #   }
#   #   backend_params    = [
#   #     # health check path, port name, port number, timeout seconds.
#   #     "/,http,9292,10"
#   #   ]
# }

#   # resource "google_compute_backend_service" "default" {
#   #   name          = "puma-service"
#   #   health_checks = [google_compute_http_health_check.default.id]
#   # }

#   # resource "google_compute_http_health_check" "default" {
#   #   name               = "puma-health-check"
#   #   request_path       = "/"
#   #   check_interval_sec = 1
#   #   timeout_sec        = 1
#   # }
