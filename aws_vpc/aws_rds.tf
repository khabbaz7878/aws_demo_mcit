# Create AWS RDS Database
module "rdsdb" {
  source  = "terraform-aws-modules/rds/aws"
  #version = "2.34.0"
  version = "3.0.0"
  identifier = var.db_instance_identifier
 
  name     = var.db_name  # Initial Database Name
  username = var.db_username
  password = var.db_password
  port     = 3306
 
 
  multi_az               = true
  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.rdsdb_sg.security_group_id]
