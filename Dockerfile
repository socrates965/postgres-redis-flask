FROM python:alpine3.9 

WORKDIR /docker-flask-app

RUN apk update && apk add --no-cache\
    gcc \
    python3-dev \
    musl-dev \
    postgresql-dev \
    build-base \
    linux-headers \ 
    pcre-dev

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

#COPY ./.env ./
COPY ./src ./src
COPY ./uwsgi-app.ini ./

ENV PYTHONPATH /docker-flask-app

EXPOSE 80
EXPOSE 9191
#CMD ["uwsgi", "./uwsgi-app.ini"]
CMD ["src/app/app.py"]