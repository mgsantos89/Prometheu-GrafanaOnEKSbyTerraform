resource "helm_release" "eks_helm_monitoring" {
  name       = "prometheus-community"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  version    = "47.1.0"  # Definindo a versão do chart
  #Opetei por esse versão pois a mais atual está com problemas em provisionar PVC

  set {
    name  = "nameSpaceOverride"
    value = "monitoring"
  }

    set {
    name  = "grafana.persistence.enabled"
    value = "true"
  }

  set {
    name  = "grafana.persistence.type"
    value = "pvc"
  }

  set {
    name  = "grafana.persistence.storageClassName"
    value = "gp2"
  }

  set {
    name  = "grafana.persistence.accessModes[0]"
    value = "ReadWriteOnce"
  }

  set {
    name  = "grafana.persistence.size"
    value = "50Gi"
  }

  depends_on = [ kubernetes_namespace.monitoring ]
}