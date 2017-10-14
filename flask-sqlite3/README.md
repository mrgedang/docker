This is simple counter application.

This application using flask microframework and 
sqlite3 to save hit number.

Before run this code, better clear your docker system.

---
GG➜  flask-sqlite3 : master ✘ :✹✭ ᐅ  docker system prune -f  
Deleted Containers:
b12f9075a0833002b4b8ae39f807027ac53a323d5f667b6823f48004ea74aaf6

Deleted Networks:
flasksqlite3_default

Total reclaimed space: 241.6kB                                                 
GG➜  flask-sqlite3 : master ✘ :✹✭ ᐅ  docker-compose up --build
Creating network "flasksqlite3_default" with the default driver
Building web
Step 1/5 : FROM python:3.4-alpine
 ---> 27a0e572c13a
Step 2/5 : ADD . /code
 ---> 1cdf1f940ae2
Step 3/5 : WORKDIR /code
 ---> e30fa5568bb9
Removing intermediate container 4205f0f9e594
Step 4/5 : RUN pip install -r requirements.txt
 ---> Running in aeb99a3de2c2
Collecting flask (from -r requirements.txt (line 1))
  Downloading Flask-0.12.2-py2.py3-none-any.whl (83kB)
Collecting click>=2.0 (from flask->-r requirements.txt (line 1))
  Downloading click-6.7-py2.py3-none-any.whl (71kB)
Collecting itsdangerous>=0.21 (from flask->-r requirements.txt (line 1))
  Downloading itsdangerous-0.24.tar.gz (46kB)
Collecting Jinja2>=2.4 (from flask->-r requirements.txt (line 1))
  Downloading Jinja2-2.9.6-py2.py3-none-any.whl (340kB)
Collecting Werkzeug>=0.7 (from flask->-r requirements.txt (line 1))
  Downloading Werkzeug-0.12.2-py2.py3-none-any.whl (312kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.4->flask->-r requirements.txt (line 1))
  Downloading MarkupSafe-1.0.tar.gz
Building wheels for collected packages: itsdangerous, MarkupSafe
  Running setup.py bdist_wheel for itsdangerous: started
  Running setup.py bdist_wheel for itsdangerous: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/fc/a8/66/24d655233c757e178d45dea2de22a04c6d92766abfb741129a
  Running setup.py bdist_wheel for MarkupSafe: started
  Running setup.py bdist_wheel for MarkupSafe: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/88/a7/30/e39a54a87bcbe25308fa3ca64e8ddc75d9b3e5afa21ee32d57
Successfully built itsdangerous MarkupSafe
Installing collected packages: click, itsdangerous, MarkupSafe, Jinja2, Werkzeug, flask
Successfully installed Jinja2-2.9.6 MarkupSafe-1.0 Werkzeug-0.12.2 click-6.7 flask-0.12.2 itsdangerous-0.24
 ---> 320e2de19e2f
Removing intermediate container aeb99a3de2c2
Step 5/5 : CMD python app.py
 ---> Running in bb4735b6e175
 ---> 34d25eb16af8
Removing intermediate container bb4735b6e175
Successfully built 34d25eb16af8
Successfully tagged flasksqlite3_web:latest
Creating flasksqlite3_web_1 ... 
Creating flasksqlite3_web_1 ... done
Attaching to flasksqlite3_web_1
web_1  |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
web_1  |  * Restarting with stat
web_1  |  * Debugger is active!
web_1  |  * Debugger PIN: 229-202-749
---

Check the counter :
GG➜  composetest  ᐅ  curl 172.19.0.2:5000    
Hello World! I have been seen 1 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 2 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 3 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 4 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 5 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 6 times.
GG➜  composetest  ᐅ  curl 172.19.0.2:5000
Hello World! I have been seen 7 times.
GG➜  composetest  ᐅ  

