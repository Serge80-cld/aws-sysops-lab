# 06 — Observabilité : CloudWatch, Logs, Métriques et VPC Flow Logs

L’observabilité est essentielle pour comprendre le comportement de l’infrastructure, détecter les anomalies et optimiser les performances.  
Cette section décrit les mécanismes mis en place pour assurer une visibilité complète sur l’architecture AWS.

## 1. CloudWatch Logs

CloudWatch Logs est utilisé pour centraliser les journaux provenant de :

- Instances EC2 (via l’agent CloudWatch)
- ALB Access Logs
- Applications (stdout/stderr)
- Services AWS (selon configuration)

Objectifs :
- Débogage rapide
- Analyse des erreurs
- Conservation centralisée des logs

---

## 2. CloudWatch Metrics

Les métriques permettent de suivre en temps réel :

- CPU Utilization des instances EC2
- Requêtes ALB
- Latence ALB
- Statut des health checks
- Utilisation réseau
- Métriques personnalisées (si ajoutées)

Objectifs :
- Déclencher des alarmes
- Ajuster le scaling de l’ASG
- Surveiller la santé globale de l’infrastructure

---

## 3. CloudWatch Alarms

Des alarmes sont configurées pour :

- CPU trop élevée
- Latence ALB anormale
- Taux d’erreurs HTTP
- Instances unhealthy dans l’ASG

Objectifs :
- Détection proactive
- Réaction rapide aux incidents
- Intégration possible avec SNS pour alerting

---

## 4. VPC Flow Logs

Les VPC Flow Logs permettent d’analyser :

- Le trafic entrant/sortant des subnets
- Les connexions autorisées/refusées
- Les comportements réseau suspects

Objectifs :
- Analyse réseau avancée
- Détection d’activités anormales
- Support pour les audits de sécurité

---

## 5. Logs ALB (Access Logs)

Les logs ALB fournissent :

- IP source
- Chemin demandé
- Code HTTP
- Latence
- Cible EC2 sélectionnée

Objectifs :
- Analyse du trafic
- Détection d’attaques (scans, brute force)
- Optimisation des performances

---

## Conclusion

L’observabilité repose sur trois piliers :

- **Logs** (CloudWatch Logs, ALB Access Logs)
- **Métriques** (CloudWatch Metrics)
- **Trafic réseau** (VPC Flow Logs)

Cette combinaison permet une supervision complète, conforme aux standards d’un environnement de production.
