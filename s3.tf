resource "aws_s3_bucket" "backend" {
  bucket = "jesse-s3-bucket-0123"

  tags = {
    Name        = "jesse-s3-bucket-0123"
  }
}

# S3 version control
resource "aws_s3_bucket_versioning" "backend" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 resource bucket policy
data "aws_iam_policy_document" "backend" {
  statement {
    sid = "Public View"
    principals {
      type = "AWS"
      identifiers = [ "*" ]
    }
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.backend.arn, "${aws_s3_bucket.backend.arn}/*"
    ]
  }
}

# attach policy
resource "aws_s3_bucket_policy" "backend" {
  bucket = aws_s3_bucket.backend.id
  policy = data.aws_iam_policy_document.backend.json
}
