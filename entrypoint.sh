#!/bin/bash
set -e

echo "#########################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

REQ="$(find . -name requirements.txt)"

if [ -e "$REQ" ]; then
    pip3 install -r requirements.txt
fi

# Make sure settings file is readable
chmod -R 777 .

# Override database settings to sqlite db
SETTINGS="($find . -name settings.py)"
echo "DATABASES = {'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': os.path.join(BASE_DIR, 'db.sqlite3'), }}" >> "$SETTINGS"

# run test
sh -c "python3 manage.py test"

echo "#########################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
