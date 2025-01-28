#!/bin/bash
set -e

cd /app/
echo "migrating database"
/py/bin/python manage.py migrate --noinput --settings=app.settings.migrator
