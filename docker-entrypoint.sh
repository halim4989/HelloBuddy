#!/bin/bash

echo "Starting..."
if [ "$DATABASE" = "mysql" ]
then
    echo "Waiting for mysql..."
    while ! nc -z 'db' '3306'; do
      sleep 1
    done
    echo "MySQL started"
    echo "Appling database migrations..."
    python manage.py makemigrations
    echo "Migration started"
    python manage.py migrate
    # python manage.py runserver 0.0.0.0:8000
fi

# Décommenter pour supprimer la bdd à chaque redémarrage (danger)
# echo "Clear entire database"
# python manage.py flush --no-input



exec "$@"