# django-blog

## Setup

To get up and running, follow these steps:

### Docker or VENV

This project is primarily configured for docker (my preference). But, you can 
just as easily use a python virtual environment directly and ignore the 
dockerfile & compose.yml files.

### Configure Environment Variables

Create a .env file in the project root and add the following:

```text
DJANGO_SECRET_KEY=not-a-secure-secret-key
DJANGO_DEBUG=true
DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1
DJANGO_CSRF_TRUSTED_ORIGINS=http://localhost,http://127.0.0.1

POSTGRES_REQUIRE_SSL=false
POSTGRES_DB=devdb
POSTGRES_USER=devuser
POSTGRES_PASSWORD=not-a-secure-password
POSTGRES_MIGRATOR=devmigrator
POSTGRES_MIGRATOR_PASS=not-a-secure-password
POSTGRES_HOST=db
POSTGRES_PORT=5432
```

These values will allow you to begin working with Django in development.

**Important!** Do NOT use in production.

Use Django's get_random_secret_key() function to generate a secure key.

```python
# from a python shell

from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
```

See [Django Deployment Checklist](https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/#) 
for more information.
