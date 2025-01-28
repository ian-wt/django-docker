#!/bin/bash
set -e

APP_PORT=${PORT:-8000}
cd /app/
echo "Entrypoint"

if [ "$DEV" = "true" ]; then
    echo "Starting development server"
    /py/bin/python manage.py runserver 0.0.0.0:${APP_PORT}
#   use runserver in development over guinicorn so you get autoreload
else
    echo "Starting production server"
#    for wsgi / guinicorn
    /py/bin/gunicorn --worker-tmp-dir /dev/shm app.wsgi:application \
    --bind "0.0.0.0:${APP_PORT}"
#    for asgi / daphne
#    /py/bin/daphne -b 0.0.0.0 -p ${APP_PORT} app.asgi:application
fi

# if you switch from wsgi (default) to asgi, make sure you change
#   requirements.txt to uncomment daphne and comment out guinicorn