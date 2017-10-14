This is simple counter application.

This application using flask microframework and 
sqlite3 to save hit number.

Before run this code, better clear your docker system.

---
~ docker system prune -f


~ docker-compose up --build


Successfully built 04af5a00cd88

Successfully tagged flasksqlite3_web:latest

Creating flasksqlite3_web_1 ... 

Creating flasksqlite3_web_1 ... done

Attaching to flasksqlite3_web_1

web_1  |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)

web_1  |  * Restarting with stat

web_1  |  * Debugger is active!

web_1  |  * Debugger PIN: 229-202-749



Check the counter :


~curl 172.19.0.2:5000    

Hello World! I have been seen 1 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 2 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 3 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 4 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 5 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 6 times.


~ curl 172.19.0.2:5000

Hello World! I have been seen 7 times.

~   

