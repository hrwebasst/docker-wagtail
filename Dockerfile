FROM ubuntu:14.04.3
MAINTAINER "Richard Silver hrwebasst@uoregon.edu"
RUN apt-get update && apt-get -qqy install nano curl git python2.7-dev python-setuptools postgresql-server-dev-all libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk && easy_install pip 
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN git clone https://github.com/torchbox/wagtail.git --depth 1
RUN pip install Django==1.9 psycopg2==2.6.1 django-compressor==1.6 \
				django-taggit>=0.17.4 Pillow django-redis==4.3.0 elasticsearch==2.1.0 \
				uwsgi==2.0.11.2
RUN cd wagtail && python setup.py develop && npm install && npm run build
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*