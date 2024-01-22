terraform {
  cloud {
    organization = "mcit20"

    workspaces {
      name = "aws_demo_mcit"
    }
  }
}
