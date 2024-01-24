module "rdsdb" {
 source = "terraform-aws-modules/rds/aws"
 version = "~> 2.0"

 identifier = "mydb"

 engine            = "mysql"
 engine_version    = "5.7"
 instance_class    = "db.t2.large"
 allocated_storage = 5

 name     = "mydb"
 username = "foo"
 password = "foobarbaz"
 port     = "3306"

 vpc_security_group_ids = ["sg-12345678"]

 maintenance_window = "Mon:00:00-Mon:03:00"
 backup_window      = "03:00-06:00"

 # Enhanced Monitoring - see example for details on how to create the role
 # by yourself, you need to assign the required permissions to the role.
 monitoring_interval    = "30"
 monitoring_role_name   = "MyRDSMonitoringRole"
 create_monitoring_role = true
}
