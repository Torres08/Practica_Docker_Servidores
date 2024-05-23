
Botnet en python
    Simple DDOs botnet with basic authentication system written in Python

https://github.com/wodxgod/PYbot


¿Que quiero que haga?
 1. Pagina web en localhost que muestra imagen (a ser posible poner nuestra granja web) (servidor webFlask)
 2. servidor C&C y nuestros bots
 3. telnet para ver los bots en linea 
 4. lanzar el ataque http flood (200 peticiones GET al servidor web)
 5. lanzat ataque TCP Flood
TCP Flood 


Requesitos
 Python3 + enviroment
 pip install flask
 creamos el webflash en http://127.0.0.1:5000/ (default)
 cnc 

Pasos para la demo
1. Inicializamos WebFlask - python3 ./Website/app.py
2. Lanzamos el servidor C&C - python3 cnc.py 1234
3. nos conectamos al servidor C&C - telnet 0.0.0.0 1234 (root:root)
4. help
5. .syn 0.0.0.0 5000 10 (tiempo en segundos)
