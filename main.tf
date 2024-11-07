# main.tf in root 
module "ec2_instance" {
  source        = "./Modules/EC2"         # Relative path to the EC2 module
  ami           = "ami-06b21ccaeff8cd686" # valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = "subnet-099580fc479efb633" # valid subnet ID
  key_name      = "terr_server_key"          # your actual key pair name
  instance_name = "EC2_terraform"
}

# Output block in main.tf
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2_instance.instance_public_ip
}