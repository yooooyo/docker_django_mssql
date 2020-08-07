FROM ubuntu:20.04
MAINTAINER DavidTsai <david.tsai@hp.com>
# ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y nano
RUN apt-get install -y curl
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y uwsgi


ADD catweb /
RUN ln -s /mynginx.conf /etc/nginx/sites-available/
RUN ln -s /mynginx.conf /etc/nginx/sites-enabled/
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get install apt-transport-https | apt-get update
RUN apt-get install -y dialog
RUN bash /install.sh 

RUN apt-get install -y unixodbc-dev
RUN pip3 install -r Lab_Web_Django/requirements.txt
RUN apt-get install -y uwsgi-plugin-python3
# RUN ["uwsgi","--ini","/myuwsgi.ini","--plugins","python3"]
EXPOSE 8002
ENTRYPOINT ["bash", "/run.sh"]

# WORKDIR /Lab_Web_Django/Cat_Auto_Web
# CMD ["python3", "manage.py","runserver","0.0.0.0","8002"]
# RUN python3 manage.py runserver 0.0.0.0:8002
# RUN uwsgi --ini /myuwsgi.ini --plugins python3

