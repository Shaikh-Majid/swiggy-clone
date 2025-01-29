terraform {
  backend "s3" {
    bucket = "mys3backent-bkt"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}