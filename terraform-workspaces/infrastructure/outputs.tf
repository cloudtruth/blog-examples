output "zone" {
  value = aws_instance.cloudtruth.availability_zone
}

output "AMI" {
  value = aws_instance.cloudtruth.ami
}

output "instance_type" {
  value = aws_instance.cloudtruth.instance_type
}

output "instance_name" {
  value = aws_instance.cloudtruth.tags.Name
}