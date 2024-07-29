Voici un README amélioré et clarifié pour guider les apprenants à créer une application ViteJS avec un Docker Compose intégrant deux conteneurs :

---

# Chat Application avec ViteJS et Docker

Cette application est construite avec ViteJS et JavaScript Vanilla. Elle utilise un conteneur Docker pour exécuter une interface de chat qui communique avec une IA sur Ollama.

## Objectif

1. **Pull ollama/ollama sur la registry de docker et entrer en commande `ollama pull qwen2:0.5b`**
2. **Créer une image Docker pour l'application ViteJS.**
3. **Utiliser Docker Compose pour orchestrer deux conteneurs : l'application ViteJS et l'IA Ollama.**

## Étapes de développement

### 1. Créer une image Docker pour l'application ViteJS

Commencez par construire et tester l'application ViteJS localement.

1. **Installer les dépendances et lancer le serveur de développement :**

   Utilisez les commandes suivantes pour installer les dépendances et lancer le serveur de développement :

   ```bash
   npm install
   npm run dev
   ```

   Cette commande démarre l'application en mode développement, permettant de voir les modifications en temps réel.

2. **Construire l'application pour la production :**

   Une fois satisfait du développement, construisez l'application pour la production :

   ```bash
   npm run build
   ```

   Cette commande crée un répertoire `dist` contenant les fichiers statiques optimisés.

3. **Créer une image Docker :**

   Créez un fichier `Dockerfile` à la racine de votre projet avec le contenu suivant :

   ```dockerfile
   # Utilise l'image de base Nginx
   FROM nginx:latest
   ```

   # Copie les fichiers de l'application dans le répertoire Nginx

   COPY ./dist/ /usr/share/nginx/html

   # Copie le fichier de configuration Nginx personnalisé

   COPY nginx.conf /etc/nginx/conf.d/default.conf

   # Expose le port 80 pour Nginx

   EXPOSE 80

````

Pour construire l'image Docker :

```bash
docker build -t my-vite-app .
````

Remplacez `my-vite-app` par le nom souhaité pour votre image Docker.

### 2. Utiliser Docker Compose pour orchestrer les conteneurs

Docker Compose permet de définir et de gérer plusieurs conteneurs.

1. **Créer un fichier `docker-compose.yml` :**

   À la racine de votre projet, créez un fichier `docker-compose.yml` avec le contenu suivant :

   ```yaml
   services:
     web:
       image: my-vite-app
       build: .
       ports:
         - "3000:3000"

     ollama:
       image: ollama/ollama
       ports:
         - "11434:11434"
   ```

   - **`web`** : Définit le service pour votre application ViteJS.
   - **`ollama`** : Définit le service pour l'IA Ollama.

2. **Lancer Docker Compose :**

   Exécutez la commande suivante pour démarrer les services définis dans `docker-compose.yml` :

   ```bash
   docker-compose up
   ```

   Cette commande construit et lance les conteneurs définis dans le fichier compose.

### Résumé

Vous avez maintenant une application ViteJS s'exécutant dans un conteneur Docker, avec une interface de chat communiquant avec une IA Ollama, également exécutée dans un conteneur Docker. Utilisez Docker Compose pour gérer ces conteneurs, facilitant ainsi le déploiement et l'orchestration de votre application.
