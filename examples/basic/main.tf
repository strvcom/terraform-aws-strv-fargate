terraform {
  required_version = "~> 0.11.11"
}

provider "aws" {
  version = "~> 1.52.0"
  region  = "us-east-1"
  profile = "playground"
}

module "fargate" {
  source = "../../"

  name = "basic-example"

  repo_name  = "<github_repo_name>" # CHANGE THIS
  repo_owner = "<github_username>"  # CHANGE THIS

  services = {
    api = {
      task_definition = "api.json"
      container_port  = 3000
      cpu             = "256"
      memory          = "512"
      replicas        = 3

      registry_retention_count = 15
      logs_retention_days      = 14
    }
  }
}
