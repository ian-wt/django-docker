from app.settings import *

# noinspection PyUnresolvedReferences
DATABASES["default"]["USER"] = os.environ["POSTGRES_MIGRATOR"]
# noinspection PyUnresolvedReferences
DATABASES["default"]["PASSWORD"] = os.environ["POSTGRES_MIGRATOR_PASS"]
