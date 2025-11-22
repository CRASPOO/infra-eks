resource "kubectl_manifest" "service" {
  depends_on = [kubectl_manifest.deploy]
  yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: customers-service
  namespace: customers
spec:
  selector:
      app: customers
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
YAML
}
