terraform {
  backend "s3" {
    bucket = "hawa-terraform"
    key    = "state/hawa_backend_config"
    region = "us-west-2"
  }
}