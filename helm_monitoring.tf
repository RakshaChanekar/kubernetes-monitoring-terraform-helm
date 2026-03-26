resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

# ✅ Lightweight Prometheus
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"

  timeout = 600

  # 🔥 Disable storage (important for small clusters)
  set {
    name  = "server.persistentVolume.enabled"
    value = "false"
  }
}

# ✅ Grafana (separate)
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"

  set {
    name  = "adminPassword"
    value = "admin123"
  }
}