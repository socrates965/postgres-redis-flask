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

#USER 1001
#COPY ./.env ./
COPY ./src ./src
COPY ./uwsgi-app.ini ./

RUN chgrp -R 0 /docker-flask-app/src/app && \
    chmod -R g=u /docker-flask-app/src/app

ENV PYTHONPATH /docker-flask-app

EXPOSE 80
EXPOSE 9191
#CMD ["uwsgi", "./uwsgi-app.ini"]

RUN adduser -D worker
USER worker
COPY --chown=worker:worker . .

#RUN ["chmod", "+x", "/docker-flask-app/src/app/app.py"]

CMD ["python","src/app/app.py"]