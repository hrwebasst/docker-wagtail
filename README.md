# docker-wagtail

This is purely a development environment for the time being a quick way to get wagtail set up to play with.

## Goals

[] Get dev/prod containers set up
[] build docker-compose for dev/prod
[] separate services for redis, gulp, production
[] simple instructions for hosting with nginx proxy

## instructions

```bash
docker run -it --rm -v `pwd`/project:/project hrwebasst/wagtail bash -c "cd project && wagtail start xxxx && cd xxxx && python manage.py migrate && python manage.py createsuperuser"
```
Replace xxxx with your project name

```bash
docker run -it --rm -p 8000:8000 -v `pwd`/project:/project hrwebasst/wagtail python project/xxxx/manage.py runserver 0.0.0.0:8000
```