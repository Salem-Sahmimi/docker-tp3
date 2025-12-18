# 🐳 Docker TP
#3 – Nginx / PHP / MariaDB

## 🎯 Objectif du TP
Ce TP a pour but de mettre en place une architecture web simple basée sur Docker, sans puis avec Docker Compose, comprenant :
- Un serveur HTTP (Nginx)
- Un interpréteur PHP (PHP-FPM)
- Une base de données SQL (MariaDB)
- Une communication inter-containers via un réseau Docker dédié

## 🏗️ Architecture
Navigateur → Nginx (HTTP) → PHP-FPM (SCRIPT) → MariaDB (DATA)

## 📁 Structure du projet
docker-tp3/
├── etape1/
├── etape2/
│ ├── config/
│ │ └── default.conf
│ ├── initdb/
│ │ └── create.sql
│ ├── src/
│ │ ├── index.php
│ │ └── test.php
│ ├── Dockerfile
│ └── launch.sh
├── etape3/
│ └── docker-compose.yml
└── README.md

shell
Copier le code

## 🚀 Lancement des étapes
### Étape 1 et 2 (sans Docker Compose)
chmod +x launch.sh
./launch.sh

bash
Copier le code
Puis ouvrir dans un navigateur :
- http://localhost:8080/
- http://localhost:8080/test.php (étape 2)

### Étape 3 (avec Docker Compose)
docker compose up --build

markdown
Copier le code
Accès identique :
- http://localhost:8080/
- http://localhost:8080/test.php

## ✅ Tests de validation
- Affichage de phpinfo() sur la page principale
- Exécution de requêtes SQL depuis PHP
- Incrémentation du compteur à chaque rafraîchissement de test.php
- Communication fonctionnelle entre les containers HTTP, SCRIPT et DATA

## 🧰 Technologies utilisées
Docker, Docker Compose, Nginx, PHP 8 (PHP-FPM), MariaDB

## 📝 Remarques
- Chaque étape utilise un réseau Docker dédié
- Les containers sont recréés à chaque lancement pour éviter les conflits
- Aucun framework PHP n’est utilisé

## 👤 Auteur
TP réalisé par Salem SAHMIMI
