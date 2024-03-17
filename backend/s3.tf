resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "saif-cdit01-state-bucket"  # Replace with your desired bucket name
  acl    = "private"  # Optional: Adjust ACL as needed

  tags = {
    Name = "TerraformStateBucket"
    Environment = "Production"
  }
}
