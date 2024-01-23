terraform{
  required_providers {
    aws={
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
    cloud {
        organization = "mcit20"
      workspaces {
        name = "aws_demo_mcit"
      }
    }

}
