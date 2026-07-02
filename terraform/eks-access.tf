# Fetches the account ID of the AWS profile currently running Terraform
data "aws_caller_identity" "current" {}

resource "aws_eks_access_entry" "github_actions_admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/github-actions-admin"
}

resource "aws_eks_access_policy_association" "github_actions_admin_admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/github-actions-admin"
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}