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
