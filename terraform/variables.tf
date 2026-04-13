variable "aws_region" {
  description = "Région AWS utilisée pour le déploiement"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Nom du projet utilisé pour le tagging"
  type        = string
  default     = "aws-sysops-lab"
}

variable "environment" {
  description = "Environnement de déploiement (dev, staging, prod)"
  type        = string
  default     = "dev"
}
