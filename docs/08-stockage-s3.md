# 08 — Stockage : Amazon S3

Amazon S3 est utilisé dans cette architecture pour stocker des données critiques liées à l’infrastructure et à l’observabilité.  
Ce service offre une durabilité de 99.999999999% et constitue un composant essentiel dans les environnements Cloud modernes.

## 🔷 1. Cas d’usage dans ce projet

### a) Logs CloudTrail
- Stockage centralisé des journaux d’audit
- Versioning activé
- Blocage des suppressions accidentelles (MFA Delete recommandé)

### b) Logs ALB (Access Logs)
- Analyse du trafic HTTP/HTTPS
- Détection d’anomalies
- Support pour les audits de sécurité

### c) Artefacts CI/CD (optionnel)
- Stockage des artefacts de build
- Conservation des versions
- Intégration avec GitHub Actions

---

## 🔷 2. Sécurité S3

Les bonnes pratiques suivantes sont appliquées :

- **Blocage de l’accès public** (S3 Block Public Access)
- **Chiffrement côté serveur (SSE-KMS)**
- **Politiques IAM restrictives**
- **Bucket Policy** limitant l’accès aux services autorisés
- **Versioning activé** pour éviter les pertes de données

Objectif :  
Garantir un stockage sécurisé, conforme aux standards AWS.

---

## 🔷 3. Organisation des buckets

Exemples de buckets utilisés :

- `logs-cloudtrail-<account-id>`
- `logs-alb-<account-id>`
- `ci-artifacts-<account-id>` (optionnel)

Chaque bucket a :
- Une politique dédiée
- Un chiffrement KMS
- Un cycle de vie configurable (transition vers Glacier)

---

## 🔷 4. Objectif du design

- Centraliser les logs
- Sécuriser les données sensibles
- Faciliter les audits
- Réduire les coûts via les classes de stockage
- Respecter les bonnes pratiques AWS Well‑Architected

S3 joue un rôle clé dans la fiabilité et la sécurité de l’infrastructure.
