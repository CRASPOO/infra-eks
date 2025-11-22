resource "kubectl_manifest" "deploy" {
  depends_on = [kubectl_manifest.namespace]
  yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: customers-deploy
  namespace: customers
spec:
  replicas: 3
  selector:
    matchLabels:
       app: customers
  template:
    metadata:
      labels:
         app: customers
    spec:
      containers:
        - name: customers
          image: nginx:1.25
          ports:
            - containerPort: 80
YAML
}
