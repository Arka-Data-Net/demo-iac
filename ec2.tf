module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "my-first-instance"

  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.dev.id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
