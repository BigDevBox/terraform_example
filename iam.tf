resource "aws_iam_role" "bigdevbox-terraform" {
  name        = "bigdevbox"
  description = "Default Admin IAM Role for bigdevbox instances"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

  tags = {
    bigdevbox = "bigdevbox-admin"
  }
}

resource "aws_iam_role_policy_attachment" "bigdevbox-terraform-admin-attachment" {
  role       = aws_iam_role.bigdevbox-terraform.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "bigdevbox-terraform-admin" {
  name = "bigdevbox-terraform-admin"
  role = aws_iam_role.bigdevbox-terraform.name
}
