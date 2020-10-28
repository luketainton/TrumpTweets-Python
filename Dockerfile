FROM python:3.9-alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
WORKDIR /srv
COPY . /srv
RUN apk add gcc && pip install --upgrade pip pipenv && pipenv install
CMD ["uwsgi", "app/app.ini"]
EXPOSE 8080