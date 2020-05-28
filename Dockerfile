FROM python:3.7-alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
WORKDIR /srv
COPY . /srv
RUN apk add gcc && pip install -r requirements.txt
CMD ["uwsgi", "app/app.ini"]
EXPOSE 8080