# docker_django_mssql

<h2>Description</h2>
<p>This docker file is django web to connect mssql in ubuntu
and bound a port 8002:8002, other machines can access by hostname.
<code>http://hostname:port/</code>
</p>

<h2>Enviroment</h2>
<ul>
<li>Ubuntu 20.04</li>
<li>Python3.8.2</li>
</ul>
<hr>

<h2>Setting</h2>
<p>For connecting by hostname need to install samba package in ubuntu host computer</p>
<code>sudo apt-get install samba</code>
