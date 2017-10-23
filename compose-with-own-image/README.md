## Compose With Own Image

Yay.. creating one service with own image.
I mean, i set custom configuration from docker-compose.yml, not using Dockerfile. :D

**How to run this code?**
```
~ cd compose-with-own-image
~ docker-compose up -d
```

**Check the code**
```
~ curl 172.19.0.3:80/index.php -H "Host: notnumerik.com"
Isi config.php seperti berikut : <br><hr><pre>&lt;?php
	define('db_host','db:3306');
	define('db_user','usertest');
	define('db_pass','passtest');
	define('db_name','dbtest');
	
	mysql_connect(db_host,db_user,db_pass);
	mysql_select_db(db_name);
?&gt;
</pre>  

~ curl 172.19.0.3:80/index.php                          
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>403 Forbidden</title>
</head><body>
<h1>Forbidden</h1>
<p>You don't have permission to access /index.php
on this server.</p>
</body></html>

```

Forbidden because mod security not allow numeric Host Header.