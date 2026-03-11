resource "aws_instance" "app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    log_group_name = aws_cloudwatch_log_group.app_logs.name
  })

  tags = {
    Name = "${var.project_name}-app"
  }
}
