data "aws_security_group" "default_14c9c5da" {
  id = "sg-06657ac0b9a546c29"
}

resource "aws_security_group" "aikart_email_agent_sg_a2c49eff" {
  name        = "aikart-email-agent-sg"
  description = "launch-wizard-1 created 2026-09-02T06:40:09.473Z"
  vpc_id      = data.aws_vpc.vpc_08fe12ce7261c0ff8_cccdbe8e.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "aws_elasticbeanstalk_ec2_role_c4548318" {
  name                 = "aws-elasticbeanstalk-ec2-role"
  path                 = "/service-role/"
  max_session_duration = 3600

  assume_role_policy = jsonencode({
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        }
      }
    ],
    "Version" : "2012-10-17"
  })
}

data "aws_iam_role" "aws_elasticbeanstalk_service_role_4c44fe6a" {
  name = "aws-elasticbeanstalk-service-role"
}