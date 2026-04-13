# 09 — Terraform : Structure, Modules et Bonnes Pratiques

Terraform est utilisé pour automatiser et standardiser l’infrastructure AWS.  
Cette section décrit l’organisation du code, les modules, les bonnes pratiques et les choix d’architecture IaC.

---

## 🔷 1. Structure du dossier Terraform

L’infrastructure est organisée selon une structure claire et modulaire :
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── modules/
│    ├── vpc/
│    ├── compute/
│    ├── security/
│    └── s3/
└── backend/
├── s3.tf
└── dynamodb.tf

Code

Objectifs :
- Séparation claire des responsabilités
- Réutilisabilité des modules
- Standardisation du code
- Maintenabilité long terme

---

## 🔷 2. Modules Terraform

Les modules permettent de structurer l’infrastructure en blocs cohérents.

### a) Module VPC
- VPC
- Subnets publics/privés
- NAT Gateway
- Tables de routage
- VPC Flow Logs

### b) Module Compute
- Launch Template
- Auto Scaling Group
- Target Group
- ALB

### c) Module Sécurité
- IAM Roles
- IAM Policies
- Security Groups
- CloudTrail
- Config
- GuardDuty

### d) Module S3
- Buckets pour logs
- Chiffrement KMS
- Versioning
- Lifecycle rules

Objectif :  
Créer une architecture modulaire, réutilisable et conforme aux bonnes pratiques.

---

## 🔷 3. Backend Terraform (S3 + DynamoDB)

Le backend distant permet :

- Le stockage du **state** dans un bucket S3
- Le **verrouillage** du state via DynamoDB
- La collaboration multi‑utilisateurs
- La prévention des corruptions de state

Avantages :
- Sécurité
- Fiabilité
- Travail en équipe
- Historique des modifications

---

## 🔷 4. Bonnes pratiques appliquées

- Utilisation systématique des **tags**
- Variables typées et documentées
- Outputs propres et limités
- Modules versionnés
- `terraform fmt` et `validate` intégrés au pipeline CI/CD
- Séparation claire entre :
  - Code générique (modules)
  - Code spécifique (racine)

---

## 🔷 5. Objectif du design Terraform

- Code propre et maintenable
- Architecture modulaire
- Déploiement reproductible
- Sécurité renforcée
- Intégration fluide avec GitHub Actions

Terraform est au cœur de l’automatisation de cette infrastructure AWS.
