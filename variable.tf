# variable.tf

variable "aws_region" {
  description = "AWS region used to deploy all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used as a prefix for all resources"
  type        = string
  default     = "terraform-asg"                                   
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "asg_min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 5
}

variable "asg_desired_capacity" {
  description = "Desired number of instances at launch"
  type        = number
  default     = 2
}

variable "s3_bucket_name" {
  description = "Unique S3 bucket name for the Terraform remote backend"
  type        = string
  default     = "my-only-terraform-backend-2024" 
}