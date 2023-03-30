# security
module "db_sg" {
  source = "./modules/rds"
  sg_name = "${var.default_tags.env}-db-sg"
  description = "SG for terraform demo"
  vpc_id = aws_vpc.main.id
  sg_db_ingress = var.sg_db_ingress
  sg_db_egress = var.sg_db_egress
  sg_source = aws_instance.main.vpc_security_group_ids
}
# db subnet group
# cluster
# cluster instances
