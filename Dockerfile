
FROM alpine

LABEL "com.github.actions.name"="Django Test runner"
LABEL "com.github.actions.description"="Runs Django tests"
LABEL "com.github.actions.icon"="command"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/vabene1111/django-test-action/"

RUN apk update
RUN apk upgrade
RUN apk --no-cache add \
    python3 \
    python3-dev \
    postgresql-client \
    postgresql-dev \
    build-base \
    gettext

RUN pip3 install --upgrade pip
RUN pip3 install django
RUN python3 --version ; pip3 --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
