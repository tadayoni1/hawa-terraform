resource "aws_iam_role" "iam_role" {
  name = "${var.EC2InstanceRole}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "0"
    },
    {
        "Sid": "1",
        "Effect": "Allow",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.S3BucketName}/*"
    },
    {
        "Sid": "2",
        "Effect": "Allow",
        "Action": "s3:ListBucket",
        "Resource": "arn:aws:s3:::${var.S3BucketName}"
    }
  ]
}
EOF

  tags = {
    Name = "${var.EnvironmentName}-iam-role"
  }
}