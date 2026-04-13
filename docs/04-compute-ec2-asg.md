# 04 — Compute : EC2, Launch Template et Auto Scaling Group

Cette section décrit la couche compute de l’architecture, responsable de l’exécution de l’application.  
Elle repose sur un ensemble cohérent : **Launch Template → Auto Scaling Group → ALB**.

## 🔷 1. Launch Template

Le Launch Template définit la configuration de base des instances EC2 :

- AMI utilisée
- Type d’instance (ex : t3.micro)
- User Data (bootstrap)
- Tags
- Security Group associé
- Paramètres réseau (subnets privés)

Avantages :
- Versioning natif
- Réutilisable dans plusieurs ASG
- Standardisation des instances

## 🔷 2. Auto Scaling Group (ASG)

L’ASG gère automatiquement le nombre d’instances EC2 selon la charge.

Caractéristiques :
- Instances déployées dans **2 subnets privés** (multi‑AZ)
- Min/Max/Desired capacity configurables
- Health checks ALB + EC2
- Remplacement automatique des instances défaillantes
- Scaling basé sur des métriques CloudWatch (CPU, requêtes ALB, etc.)

Objectifs :
- Haute disponibilité
- Scalabilité automatique
- Résilience aux pannes AZ

## 🔷 3. Application Load Balancer (ALB)

L’ALB distribue le trafic entrant vers les instances EC2.

Fonctionnalités clés :
- Listener HTTP/HTTPS
- Target Group (instances EC2 privées)
- Health checks
- Logs d’accès (ALB Access Logs)
- Intégration native avec l’ASG

Pourquoi ALB ?
- Séparation du trafic public/privé
- Sécurité renforcée (instances non exposées)
- Observabilité améliorée

## 🔷 4. Flux réseau

1. Le client envoie une requête vers l’ALB (subnets publics)
2. L’ALB redirige vers le Target Group
3. Le Target Group envoie vers les instances EC2 (subnets privés)
4. Les instances sortent vers Internet via la NAT Gateway si nécessaire

## 🔷 5. Objectif du design

- Instances **non exposées** à Internet
- Scalabilité automatique
- Observabilité via ALB + CloudWatch
- Architecture conforme aux bonnes pratiques AWS Well‑Architected
