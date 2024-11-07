# AWS Monitoring Setup with Terraform

## Description
Ce projet configure la surveillance d'un réseau AWS avec Terraform. Il crée un environnement comprenant un VPC, un sous-réseau public, une instance EC2, et met en place des métriques de surveillance et des alertes pour le trafic réseau.

### Fonctionnalités principales
- Création d'un VPC et d'un sous-réseau public
- Déploiement d'une instance EC2
- Configuration d'une ACL réseau pour bloquer les paquets ICMP en sortie
- Mise en place de logs de flux réseau (Flow Logs) vers CloudWatch
- Création de filtres de métriques CloudWatch pour détecter les rejets ICMP
- Alarme CloudWatch qui envoie une notification via SNS en cas d'erreurs ICMP

## Prérequis
- **AWS CLI** : Assurez-vous que l'outil en ligne de commande AWS est installé et configuré.
- **Terraform** : Installez Terraform pour déployer l'infrastructure.
- **Clé SSH** : Génération d'une clé SSH pour se connecter à l'instance EC2.

### Commande pour générer la clé SSH
Exécutez la commande suivante pour créer une clé SSH (format RSA 2048 bits) :
```bash
ssh-keygen -t rsa -b 2048 -m PEM -f ~/.ssh/key_aws.pem

