# infra-customers
Infra da aplicação de clientes

## Descrição
Repositório Terraform para provisionar infraestrutura AWS com EKS (Elastic Kubernetes Service) e recursos Kubernetes básicos para a aplicação de clientes.

## Recursos Provisionados

### AWS Infrastructure
- **VPC**: Virtual Private Cloud com CIDR 10.0.0.0/16
- **Subnets**: 3 subnets públicas distribuídas em diferentes zonas de disponibilidade (us-east-2a, us-east-2b, us-east-2c)
- **Internet Gateway**: Para conectividade com a internet
- **Route Tables**: Tabelas de roteamento para subnets públicas
- **Security Groups**: Grupo de segurança permitindo tráfego HTTP (porta 80)
- **S3 Bucket**: Para armazenamento de backend

### EKS Cluster
- **EKS Cluster**: Kubernetes versão 1.31
- **Node Group**: 2-3 nós t3.medium
- **IAM Roles**: Roles necessários para o cluster e nodes
- **Access Entry**: Configuração de acesso para usuários IAM

### Kubernetes Resources
- **Namespace**: namespace "customers" para organização dos recursos
- **Deployment**: Deploy com 3 réplicas da aplicação (nginx como placeholder)
- **Service**: LoadBalancer para exposição da aplicação

## Pré-requisitos
- Terraform >= 1.0
- Credenciais AWS configuradas
- Acesso ao Terraform Cloud (workspace: infra-customers, organization: spoo-aula9-terraform)

## Uso

### Inicialização
```bash
terraform init
```

### Planejamento
```bash
terraform plan
```

### Aplicação
```bash
terraform apply
```

### Destruição
```bash
terraform destroy
```

## Variáveis Principais
- `region_default`: Região AWS (padrão: us-east-2)
- `bucket_name_backend`: Nome do bucket S3 (padrão: customers-backend)
- `instance-type`: Tipo de instância EC2 para nodes (padrão: t3.medium)
- `cidr_vpc`: CIDR block da VPC (padrão: 10.0.0.0/16)

## Outputs
- `vpc_id`: ID da VPC criada
- `vpc_cidr`: CIDR block da VPC
- `subnet_id`: IDs das subnets criadas
- `subnet_cidr`: CIDR blocks das subnets

## Estrutura do Repositório
```
.
├── README.md
├── .gitignore
├── providers.tf          # Configuração dos providers (AWS, Kubernetes, kubectl)
├── backend.tf            # Configuração do backend Terraform Cloud
├── vars.tf               # Declaração de variáveis
├── vpc.tf                # Configuração da VPC
├── subnet.tf             # Configuração das subnets
├── internet.g.tf         # Internet Gateway
├── route.tf              # Route tables e associações
├── securityg.tf          # Security groups
├── iam-role.tf           # IAM roles para EKS
├── eks.cluster.tf        # Configuração do cluster EKS
├── eks-node.tf           # Node group do EKS
├── access-entry.tf       # Access entries e policies do EKS
├── data.tf               # Data sources
├── k8s.auth.tf           # ConfigMap aws-auth
├── k8s-namespace.tf      # Namespace Kubernetes
├── k8s-deployment.tf     # Deployment Kubernetes
├── k8s-service.tf        # Service Kubernetes
├── buckets3.tf           # Bucket S3
└── output.tf             # Outputs
```

## Referência
Este repositório foi baseado no repositório [terraform-soat](https://github.com/CRASPOO/terraform-soat).
