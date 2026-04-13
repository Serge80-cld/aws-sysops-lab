# 02 — Architecture globale

Cette section présente la vision d’ensemble de l’architecture AWS mise en place dans ce projet.  
L’objectif est de construire une plateforme Cloud **scalable**, **sécurisée**, **automatisée** et **observée**, en suivant les bonnes pratiques AWS Well‑Architected.

## 🔷 Composants principaux

### 1. Réseau (VPC)
- VPC multi‑AZ
- Subnets publics et privés
- NAT Gateway pour les instances privées
- Tables de routage dédiées
- Séparation claire des zones de sécurité

### 2. Compute
- Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Launch Template
- Instances EC2 dans des subnets privés

### 3. Conteneurisation (optionnel selon la variante)
- ECR pour stocker les images Docker
- Pipeline CI/CD pour build → scan → push

### 4. Sécurité
- IAM (Least Privilege)
- CloudTrail (audit)
- AWS Config (conformité)
- GuardDuty (détection de menaces)
- KMS (chiffrement)

### 5. Observabilité
- CloudWatch Logs
- CloudWatch Metrics
- VPC Flow Logs
- ALB Access Logs

## 🔷 Objectif de cette architecture

Créer une infrastructure :
- **résiliente** (multi‑AZ)
- **sécurisée** (Zero Trust)
- **automatisée** (Terraform + CI/CD)
- **maintenable** (modules Terraform)
- **documentée** (10 sections)

Cette architecture reflète les standards d’un environnement de production dans une entreprise moderne.
