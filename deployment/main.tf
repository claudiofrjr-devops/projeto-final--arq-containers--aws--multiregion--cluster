module "cluster" {
  source = "../../01-modulos_terraform_aws/projeto-final--arq-containers--modulos-terraform/cluster"

  project_name = var.project_name
  region       = var.region

  vpc_id          = data.aws_ssm_parameter.vpc.value
  private_subnets = data.aws_ssm_parameter.private_subnets[*].value
  public_subnets  = data.aws_ssm_parameter.public_subnets[*].value

  acm_certs = data.aws_acm_certificate.main[*].arn

}

