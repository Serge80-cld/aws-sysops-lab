# 05 — Sécurité AWS

La sécurité est un pilier fondamental de l’architecture AWS.  
Cette section décrit les services et mécanismes mis en place pour garantir une posture de sécurité robuste, conforme aux bonnes pratiques AWS Well‑Architected.

## 🔷 1. IAM (Identity and Access Management)

Principes appliqués :
- **Least Privilege** : permissions minimales
- **Séparation des rôles** : admin, CI/CD, instances EC2
- **IAM Roles** pour les services (EC2, GitHub Actions)
- **IAM Policies** gérées et personnalisées
- **MFA obligatoire** pour les comptes sensibles

Objectif :  
Empêcher toute escalade de privilèges et limiter l’impact d’un compte compromis.

---

## 🔷 2. CloudTrail

CloudTrail est activé pour :
- Suivre toutes les actions API
- Auditer les activités suspectes
- Conserver un historique complet des opérations

Les logs sont stockés dans un bucket S3 sécurisé.

Objectif :  
Assurer une traçabilité complète des actions dans le compte AWS.

---

## 🔷 3. AWS Config

AWS Config permet :
- De vérifier la conformité des ressources
- De détecter les dérives de configuration
- D’appliquer des règles de sécurité (ex : S3 non public)

Objectif :  
Garantir que l’infrastructure reste conforme aux standards de sécurité.

---

## 🔷 4. GuardDuty

GuardDuty analyse :
- Les logs CloudTrail
- Les VPC Flow Logs
- Les DNS Logs

Il détecte :
- Comportements anormaux
- Tentatives d’intrusion
- Activités malveillantes

Objectif :  
Détection proactive des menaces.

---

## 🔷 5. KMS (Key Management Service)

KMS est utilisé pour :
- Chiffrer les données au repos (EBS, S3, logs)
- Gérer les clés de chiffrement
- Appliquer un contrôle d’accès strict

Objectif :  
Protéger les données sensibles et respecter les exigences de conformité.

---

## 🔷 6. Sécurité réseau

- Instances EC2 **non exposées** à Internet
- ALB en frontal
- Security Groups restrictifs
- NACLs optionnelles pour renforcer la segmentation
- VPC Flow Logs activés

Objectif :  
Réduire la surface d’attaque et contrôler les flux.

---

## 🔷 Conclusion

Cette architecture applique une approche **Zero Trust**, combinant :
- Contrôle d’accès strict
- Audit continu
- Détection de menaces
- Chiffrement systématique

Elle répond aux exigences d’un environnement de production sécurisé.
