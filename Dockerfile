FROM odoo:10.0

MAINTAINER suncombo@gmail.com

USER root

# Install selected extensions and other stuff
RUN apt-get update \
 && apt-get install -y ttf-wqy-zenhei \
                       ttf-wqy-microhei \
                       locales locales-all \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
 && pip install python-slugify

COPY ./pfbfer/* /usr/lib/python2.7/dist-packages/reportlab/fonts/
COPY ./sitecustomize.py /etc/python2.7/sitecustomize.py

# Set the locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8


USER odoo
