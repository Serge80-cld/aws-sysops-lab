# 03 — Réseau VPC

Cette section détaille la conception du réseau AWS utilisé dans cette architecture.  
Le VPC constitue la fondation de l’infrastructure et suit les bonnes pratiques AWS pour la sécurité, la haute disponibilité et la séparation des flux.

## Structure du VPC

### 1. VPC principal
- CIDR : 10.0.0.0/16
- Séparation logique des ressources
- Base pour les sous-réseaux publics et privés

### 2. Subnets publics (2 AZ)
- Utilisés pour :
  - Load Balancer (ALB)
  - Bastion (optionnel)
- Routage vers Internet Gateway

### 3. Subnets privés (2 AZ)
- Utilisés pour :
  - Instances EC2 du Auto Scaling Group
  - Services internes
- Routage vers NAT Gateway

### 4. Internet Gateway
- Permet la sortie Internet pour les ressources publiques

### 5. NAT Gateway
- Permet aux instances privées d’accéder à Internet (patchs, updates)
- Une NAT Gateway par AZ pour éviter les SPOF

### 6. Tables de routage
- Route table publique → IGW
- Route table privée → NAT Gateway
- Isolation stricte entre les zones

## Sécurité réseau

- Aucun accès direct Internet vers les instances privées
- ALB en frontal pour gérer le trafic entrant
- Security Groups basés sur le principe du **Least Privilege**
- NACLs optionnelles pour renforcer la segmentation

## Objectif du design

- Haute disponibilité (multi‑AZ)
- Sécurité renforcée (instances privées)
- Scalabilité (ASG + ALB)
- Observabilité (VPC Flow Logs)
- Architecture conforme aux standards AWS Well‑Architected
