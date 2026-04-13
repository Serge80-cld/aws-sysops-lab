# 07 — CI/CD : GitHub Actions

Cette section décrit le pipeline CI/CD utilisé pour automatiser la construction, l’analyse, le déploiement et la mise à jour de l’infrastructure AWS via Terraform.

L’objectif est d’obtenir un pipeline **fiable**, **sécurisé**, **reproductible** et **entièrement automatisé**.

---

## 🔷 1. Structure générale du pipeline

Le pipeline GitHub Actions suit les étapes suivantes :

1. **Build**  
   - Construction de l’application ou de l’image Docker (si applicable)

2. **Scan**  
   - Analyse de sécurité (SAST, dépendances, image Docker)

3. **Push vers ECR**  
   - Publication de l’image dans un registre privé AWS

4. **Terraform Plan**  
   - Analyse des changements d’infrastructure

5. **Terraform Apply**  
   - Déploiement automatique dans AWS

Ce pipeline permet d’assurer une livraison continue et contrôlée.

---

## 🔷 2. Déclencheurs (Triggers)

Le pipeline se déclenche automatiquement :

- À chaque **push** sur la branche `main`
- À chaque **pull request**
- Manuellement via **workflow_dispatch**

Objectif :  
Garantir que chaque modification est testée, analysée et déployée proprement.

---

## 🔷 3. Authentification AWS

L’authentification est réalisée via :

- **OIDC GitHub → AWS IAM**
- Rôle IAM dédié au pipeline
- Permissions minimales (Least Privilege)

Avantages :
- Pas de clés AWS stockées dans GitHub
- Sécurité renforcée
- Rotation automatique

---

## 🔷 4. Étapes Terraform

Le pipeline exécute :

- `terraform init`
- `terraform fmt -check`
- `terraform validate`
- `terraform plan`
- `terraform apply -auto-approve`

Objectifs :
- Standardisation
- Validation automatique
- Déploiement reproductible

---

## 🔷 5. Sécurité du pipeline

- Secrets GitHub protégés
- Permissions GitHub Actions minimales
- Analyse de sécurité intégrée
- Rôle IAM dédié au pipeline
- Logs d’exécution centralisés

---

## 🔷 6. Objectif du design

Ce pipeline CI/CD permet :

- Une livraison continue fiable
- Une infrastructure toujours à jour
- Une réduction des erreurs humaines
- Une sécurité renforcée
- Une automatisation complète du cycle de vie

Il reflète les standards d’un environnement DevOps moderne et professionnel.
