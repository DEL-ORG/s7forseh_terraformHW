# Output the Security Group ID
output "security_group_id" {
  value       = aws_security_group.security_group.id
  description = "The ID of the Security Group"
}

# Output the Security Group Name
output "security_group_name" {
  value       = aws_security_group.security_group.name
  description = "The Name of the Security Group"
}
