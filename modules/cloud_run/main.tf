resource "google_cloud_run_v2_service_iam_binding" "invoker" {
  name     = "llm-gateway"
  location = var.region
  role     = "roles/run.invoker"
  members  = [
    "user:${var.invoker_email}"
  ]
}

# Load Balancer for IAP-enabled browser access
resource "google_compute_global_address" "default" {
  name = "llm-gateway-ip"
}

resource "google_compute_backend_service" "default" {
  name        = "llm-gateway-backend"
  protocol    = "HTTP"
  timeout_sec = 30

  backend {
    group = google_compute_region_network_endpoint_group.cloudrun_neg.id
  }

  iap {
    enabled              = true
    oauth2_client_id     = var.iap_client_id
    oauth2_client_secret = var.iap_client_secret
  }
}

resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  name                  = "llm-gateway-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region

  cloud_run {
    service = "llm-gateway"
  }
}

resource "google_compute_url_map" "default" {
  name            = "llm-gateway-urlmap"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_https_proxy" "default" {
  name             = "llm-gateway-proxy"
  url_map          = google_compute_url_map.default.id
  ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
}

resource "google_compute_managed_ssl_certificate" "default" {
  name = "llm-gateway-ssl"

  managed {
    domains = ["${google_compute_global_address.default.address}.nip.io"]
  }
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "llm-gateway-forwarding-rule"
  target     = google_compute_target_https_proxy.default.id
  port_range = "443"
  ip_address = google_compute_global_address.default.address
}

resource "google_iap_web_backend_service_iam_binding" "iap_access" {
  web_backend_service = google_compute_backend_service.default.name
  role                = "roles/iap.httpsResourceAccessor"
  members = [
    "user:${var.invoker_email}"
  ]
}