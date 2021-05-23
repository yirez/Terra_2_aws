terraform {
  backend "s3" {
    bucket = "backend-bucket-test"
    key    = "remotestate.tfstate"
    region = "eu-central-1"
    dynamodb_table="s3-state-lock"
  }
}
