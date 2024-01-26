# API O'To Rent

## Introduction

Cette API a été développée dans le contexte de l'évolution d'O'To Rent afin de répondre à des exigences applicatives multiples.

## Installation et lancement (classique)

> ⛔ Si vous souhaitez utiliser Docker, et installer et lancer l'API en une seule commande, passez à la section suivante.

### Installation des dépendances nécessaires au projet

```
npm install
```

### Mise en place de la base de données

- Se connecter à PostgreSQL

  ```bash
  sudo -i -u postgres psql
  ```
  > 🔓 `par dessus les nuages`

- Définir un nouvel utilisateur PostgreSQL qui sera le propriétaire de la base de données que nous créerons juste après (e.g. `otorent` peut être un bon nom d'utilisateur) 

  ```postgres
  CREATE ROLE oto-rent WITH LOGIN PASSWORD 'oto-rent-pw';
  ```

- Créer une base de données PostgreSQL (e.g. `oto-rent` peut être un bon nom de base de données)

  ```postgres
  CREATE DATABASE oto-rent OWNER oto-rent;
  ```

- Se placer dans le répertoire `data` de ce dépôt puis ajouter les droits en exécution pour le script de construction de la BDD

  ```bash
  sudo chmod +x construct_db.sh
  ```

- Adapter le script `construct_db.sh` si le nom d'utilisateur et/ou le nom de la base de données ne sont pas `oto-rent`

- Lancer le script

  ```bash
  bash ./construct_db.sh
  ```

  La base de données doit être prête, et des données fake y ont été ajoutées. 

  👀 Aucune réservation ou utilisateur ne sont fournis.

### Compléter le fichier d'environnement

  - SERVER_PORT : le port sur lequel le server se mettra en écoute
  - JWT_SECRET : une clé servant à générer les tokens JWT
    - Il est conseillé de générer une clé en MD5 pour complexifier la génération des tokens JWT
    - Prendre un mot usuel et le [hasher en MD5](https://md5decrypt.net/)
    - Une fois le md5 récupéré, l'utiliser en valeur pour le JWT_SECRET
  - Les paramètres de connexion à la base de données

### Lancer l'application

Plusieurs choix possibles :

- Pour un démarrage standard

  ```bash
  npm run start
  ```

- Pour un lancement en développement (avec le watcher nodemon)

  ```bash
  sudo npm install -g nodemon

  npm run dev
  ```

## Installation et lancement avec Docker

```bash
npm run docker:start
```

## Utilisation

### Documentation

Une documentation globale de l'API est disponible sur l'url `/api-docs` renseignant les fonctionnalités disponibles et les paramètres nécessaires.

### Droits & privilèges

Attention, si certaines URL ne nécessitent pas de droit spécifique (e.g. la liste des agences), d'autres auront besoin que l'utilisateur soit connecté pour pouvoir les utiliser (e.g. l'accès à une réservation) voire même qu'il ait le rôle `fleetManager` (e.g. la mise à jour d'un véhicule).

Même s'il existe une URL permettant de créer un nouveau compte `/auth/register`, le compte créé possédera par défaut le rôle `user`. Pour des raisons de sécurité, aucun passage de `user` à `fleetManager` n'est possible pour l'instant. Il faudra donc directement se connecter à la base de données et faire la mise à jour à la main le temps que le client envisage comment faire la montée de privilèges.

```sql
UPDATE account SET role = 'fleetManager' WHERE id = <id_de_lutilisateur>;
```

#### Mots de passe

⚠️ Il n'est pas garantie que cela fonctionne mais les mots de passe pour Bruce Wayne et Tony Stark devraient respectivement être `batman` et `ironman`.

### Logs du server

Les logs du server API sont sauvegardés dans le répertoire `logs` présent à la racine. Ils sont journalisés, ce qui permet de supprimer les logs les plus anciens quand on estime qu'ils ne sont plus utiles.
