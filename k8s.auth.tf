resource "kubectl_manifest" "aws_auth" {
  yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapUsers: |
    - userarn: ${var.principal_user_arn}
      username: ${var.principal_user_name}
      groups:
        - system:masters
YAML
}
