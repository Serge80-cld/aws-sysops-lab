variable "project_name" {
  type        = string
  description = "Nom du projet"
}

variable "environment" {
  type        = string
  description = "Environnement (dev/staging/prod)"
}

variable "aws_region" {
  type        = string
  description = "Région AWS"
}

variable "vpc_id" {
  type        = string
  description = "ID du VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "Subnets publics"
}

variable "private_subnets" {
  type        = list(string)
  description = "Subnets privés"
}
