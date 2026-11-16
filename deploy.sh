#!/bin/bash

# Interrompre le script immédiatement si une commande échoue
set -e

echo "========================================================="
echo "🚀 Lancement du pipeline de déploiement automatique"
echo "========================================================="

# Étape 1 : Construction de l'image Docker locale
echo "📦 Étape 1 : Construction de l'image Docker..."
docker build -t maurel-app:1.0.0 .

# Étape 2 : Injection de l'image dans l'environnement Minikube
echo "🚚 Étape 2 : Chargement de l'image dans le cluster Minikube..."
minikube image load maurel-app:1.0.0

# Étape 3 : Application du manifeste Kubernetes
echo "☸️  Étape 3 : Déploiement de l'infrastructure sur Kubernetes..."
kubectl apply -f k8s-manifest.yaml

echo "========================================================="
echo "✅ Déploiement terminé avec succès en Haute Disponibilité !"
echo "========================================================="

