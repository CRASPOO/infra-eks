resource "kubectl_manifest" "aws_auth" {
  yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapUsers: |
    - userarn: arn:aws:iam::841740286784:user/Camilarspoo
      username: Camilarspoo
      groups:
        - system:masters
YAML
}
