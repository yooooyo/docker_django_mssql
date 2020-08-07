# docker_django_mssql

# Description

This docker file is django web to connect mssql in ubuntu
and bound a port 8002:8002, other machines can access by hostname.

# Enviroment

- Ubuntu 20.04
- Python3.8.2

# Setting
For connecting by hostname need to install samba package in ubuntu host computer
`sudo apt-get install samba`
Whole web folder need to be added into catweb folder
Need to modify **myuwsgi.ini** and **mynginx.conf**

```
location /static{
    alias /Lab_Web_Django/Cat_Auto_Web/static;
}
```
```
chdir            = /Lab_Web_Django/Cat_Auto_Web

module           = Cat_Auto_Web.wsgi
```
# Run
After setting run `docker run -p 8002:8002 image bash run.sh`
