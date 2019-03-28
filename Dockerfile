
FROM python:3.7-alpine

LABEL "com.github.actions.name"="Django Test runner"
LABEL "com.github.actions.description"="Runs Django tests"
LABEL "com.github.actions.icon"="command"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/vabene1111/django-test-action/"

RUN apk add --no-cache bash
RUN pip install --upgrade pip
RUN pip install django
RUN python --version ; pip --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
