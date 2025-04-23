provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "webapp-cluster"
  cluster_version = "1.29"
  subnets         = ["subnet-abc123", "subnet-def456"]
  vpc_id          = "vpc-123456"

  node_groups = {
    webapp_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "webapp" {
  name       = "webapp"
  namespace  = "default"
  repository = "./charts/webapp"
  chart      = "."

  values = [file("values.yaml")]
}
