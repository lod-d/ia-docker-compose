#!/bin/bash

# Étape 1: Construire l'application ViteJS
echo "Installation des dépendances et construction de l'application ViteJS..."
npm install
npm run build

# Étape 2: Créer l'image Docker pour l'application ViteJS
echo "Construction de l'image Docker pour l'application ViteJS..."
docker build -t my-vite-app .

# Étape 3: Lancer Docker Compose
echo "Lancement de Docker Compose..."
docker-compose up -d

# Étape 4: Attendre que les conteneurs soient prêts
echo "Attente de la disponibilité des conteneurs..."
sleep 10

# Étape 5: Trouver le nom du conteneur Ollama
echo "Recherche du conteneur Ollama..."
OLLAMA_CONTAINER=$(docker ps --filter "ancestor=ollama/ollama" --format "{{.Names}}")

if [ -z "$OLLAMA_CONTAINER" ]; then
  echo "Erreur : Aucun conteneur Ollama trouvé."
  exit 1
fi

# Étape 6: Exécuter la commande pour installer Qwen dans le conteneur Ollama
echo "Installation de Qwen dans le conteneur Ollama..."
echo "Installation terminée. Vous pouvez accéder à l'application à l'adresse : http://localhost:8066 entrer /bye pour quitter le mode interactif."
docker exec -it $OLLAMA_CONTAINER ollama run qwen2:0.5b

# Étape 7: Terminer l'installation
