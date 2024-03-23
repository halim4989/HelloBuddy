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

    # need to migrate before restore
    echo "Restoring some data to the Database..." && python -Xutf8 ./manage.py loaddata DATABASE_dumpdata.json

fi

# Uncomment to delete the database on each reboot (danger)
# echo "Clear entire database"
# python manage.py flush --no-input



exec "$@"
