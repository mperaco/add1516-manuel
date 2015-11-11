# ACCESO REMOTO SSH

## Introducción

En está práctica, trabajaremos con el protocolo ssh para acceder remotamente desde máquinas clientes hacia un servidor que ofrece el servicio.
Para la realización de dicha práctica necesitaremos 3 máquinas: un servidor GNU/Linux OpenSuse y dos clientes (un GNU/Linux OpenSuse y otro Windows 7).

## 1. Preparativos

### Servidor SSH

En primer lugar vamos a configurar el servidor, para ello le asignamos las configuraciones de red correspondientes.

Accedemos a la herramienta Yast2 y configuramos los parámetros de red:

![imagen1](./images/01.png)
![imagen2](./images/02.png)
![imagen3](./images/03.png)

Ahora ejecutamos varios comandos para comprobar los cambios ejecutados:

![imagen4.1](./images/04.1.png)
![imagen4.2](./images/04.2.png)
![imagen4](./images/04.png)

Y también añadimos al fichero /etc/hosts los equipos ssh-client1 y ssh-client2:

![imagen4](./images/06.png)

Para terminar los preparativos del servidor, creamos 4 usuarios con nuestro primer apellido:

![imagen5](./images/05.png)

### Cliente GNU/Linux

Configuramos los parámetros de red del cliente:

![imagen7](./images/07.png)
![imagen8](./images/08.png)
![imagen9](./images/09.png)

Y añadimos en /etc/hosts los equipos ssh-server y ssh-client2

![imagen10](./images/10.png)

Por último, hacemos ping entre las dos máquinas para comprobar que todo está bien configurado:

![imagen11](./images/11.png)

### Cliente Windows

En el cliente Windows, tendremos que instalar el software cliente SSH, en este caso, la herramienta PuTTY:

![imagen12](./images/12.png)

Ahora configuramos los parámetros de red de la máquina:

![imagen13](./images/13.png)

Ponemos como clave del Administrador el DNI:

![imagen14](./images/14.png)

Y añadimos en C:\Windows\System32\drivers\etc\hosts el equipo ssh-server y ssh-client1:

![imagen15](./images/15.png)

Por últimos hacemos ping entre los dos equipos para comprobar que todo está bien configurado:

![imagen16](./images/16.png)

## 2. Instalación del servicio SSH

Vamos a instalar el servicio SSH en la máquina server, en mi caso, desde la terminal.

![imagen17](./images/17.png)

Al ejecutar el comando, nos damos cuenta de que ya está instalado el paquete.

### Comprobación

Ahora desde el **ssh-server**, verificamos que el servicio está en ejecución, y sino lo iniciamos nosotros con el comando `systemctl status/start/stop/restart sshd`:

![imagen18](./images/18.png)

### Primera conexión SSH desde el cliente

Lo primero que hacemos es comprobar el cortafuegos y ponemos como servicio autorizado el ssh:

![imagen20.0](./images/20.0.png)

Y ahora comprobamos el acceso mediante ssh desde los clientes, comprobamos que se produce el intercambio de claves:

![imagen20](./images/20.png)
![imagen21](./images/21.png)

Comprobamos el contenido del fichero /.ssh/known_hosts en el equipo ssh-client1 (la clave que aparece es la clave de identificación de la máquina server):

![imagen22](./images/22.png)

### ¿Y si cambiamos las claves del servidor?

En este punto, vamos a modificar el fichero de configuración SSH (/etc/ssh/sshd_config) y descomentamos la línea HostKey /etc/ssh/ssh_host_rsa_key:

![imagen19](./images/19.png)

Generamos nuevas claves en el server y reiniciamos el servicio SSH. A continuación, comprobamos que sucede al volver a conectarnos desde el cliente:

![imagen23](./images/23.png)

Ahora borramos la clave del cliente y nos conectamos de nuevo para que se produzca el intercambio de claves otra vez:

![imagen24](./images/24.png)

## 3. Personalización del prompt Bash

En este punto vamos a personalizar el aspecto de la consola para un usuario, para ello, modificamos el fichero .bashrc del usuario:

![imagen25](./images/25.png)

Y además creamos el fichero .alias con el siguiente contenido:

![imagen26](./images/26.png)

Hacemos la comprobación:

![imagen27](./images/27.png)

## 4. Autenticación mediante claves públicas

En este apartado vamos a configurar SSH para poder acceder desde el ssh-client1 usando el usuario 4 sin poner el password pero usando claves pública/privada. 
Vamos a configurar la autenticación mediante clave pública para acceder con nuestro usuario personal desde el equipo cliente al servidor con el usuario 1er-apellido-alumno4.

En primer lugar, iniciamos sesión con nuestro usuario y ejecutamos `ssh-keygen -t rsa` para generar un par de claves para el usuario:

![imagen28](./images/28.png)

Ahora vamos a copiar la clave pública (id_rsa.pub) del usuario de la máquina cliente al fichero `authorized_keys` del usuario perez4 en el servidor, para ello, yo he usado el comando `ssh-copy-id perez4@ssh-server`

![imagen29](./images/29.png)

Y accedemos sin escribir el password:

![imagen30](./images/30.png)

Pero desde el cliente2 si que lo pide:

![imagen31](./images/31.png)

## 5. Uso de SSH como túnel para X



## 6. Aplicaciones Windows nativas

## 7. Restricciones de uso

### Sin restricción (tipo 1)

### Restricción total (tipo 2)

### Restricción en las máquinas (tipo 3)

### Restricción sobre aplicaciones (tipo 4)
