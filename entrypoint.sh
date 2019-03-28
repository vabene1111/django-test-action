#!/bin/bash
set -e

echo "#########################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

pip install -r requirements.txt

# Make sure settings file is readable
chmod -R 777 .

# Override database settings to sqlite db
SETTINGS="($find . -name settings.py)"
echo "DATABASES = {'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': os.path.join(BASE_DIR, 'db.sqlite3'), }}" >> "$SETTINGS"

# run test
sh -c "python manage.py test"

echo "#########################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
