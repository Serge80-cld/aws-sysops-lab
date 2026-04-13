# AWS SysOps Lab – Architecture Cloud AWS

Ce dépôt contient une architecture AWS complète de niveau production, construite avec Terraform, CI/CD GitHub Actions, et les bonnes pratiques AWS Well‑Architected.

## Contenu du projet
- VPC multi‑AZ (subnets publics/privés)
- ALB + ASG + Launch Template
- CI/CD GitHub Actions (Build → Scan → Push ECR → Terraform Apply)
- Sécurité Zero Trust (IAM, CloudTrail, Config, GuardDuty, KMS)
- Observabilité CloudWatch (logs, métriques, VPC Flow Logs)
- Terraform modulaire (VPC, Compute, Security)

## Objectif
Démontrer ma capacité à concevoir, automatiser et sécuriser une architecture cloud AWS de niveau production.

## Structure
- `terraform/` : Infrastructure as Code
- `docs/` : Documentation d’architecture (10 sections)
- `ci-cd/` : Pipeline GitHub Actions

## Auteur
Serge – Cloud Engineer / DevOps AWS
