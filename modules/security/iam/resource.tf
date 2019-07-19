resource "aws_iam_role" "iam_role" {
  name = "${var.EC2InstanceRole}"
  description = "EC2 InstanceRole to access s3 Bucket"

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
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "${var.EnvironmentName}-iam-role"
  }
}

resource "aws_iam_policy" "iam_policy" {
  name        = "${var.EC2InstanceRole}"
  description = "Policy to access s3 Bucket"

  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "0",
          "Effect": "Allow",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::tirgan-hawa/*"
      },
      {
          "Sid": "1",
          "Effect": "Allow",
          "Action": "s3:ListBucket",
          "Resource": "arn:aws:s3:::tirgan-hawa"
      }
  ]
}
EOF

}

resource "aws_iam_policy_attachment" "iam-policy-attach" {
  name       = "${var.EC2InstanceRole}-attach"
  roles      = ["${aws_iam_role.iam_role.name}"]
  policy_arn = "${aws_iam_policy.iam_policy.arn}"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name       = "${var.EC2InstanceRole}-instance-profile"
  role       = "${aws_iam_role.iam_role.name}"
}