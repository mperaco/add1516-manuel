# CLIENTES LIGEROS

## Introducción

Básicamente, clientes ligeros se refiere a un ordenador cliente que en una arquitectura de red cliete-servidor depende principalmente de un servidor central para que este le ceda la imagen del sistema operativo y poder trabajar.

## Servidor LTSP

### Preparar la máquina servidora

En esta primera práctica, utilizaremos una máquina Linux, en mi caso Ubuntu, y la utilizaremos como servidor LTSP. En primer lugar, una vez ya instalada, cambiaremos la configuración de red y le asignaremos una dirección IP estática manual para la primera interfaz de red.

![imagen1] (./images/01.png)

Ahora creamos otra interfaz de red en modo interna y le asignamos también una dirección IP.

![imagen2] (./images/02.png)
![imagen3] (./images/03.png)

### Instalación del Sistema Operativo

Instalamos el sistema operativo correspondiente (Ubuntu 14.04) ejecutamos los siguientes comandos que se ven en la imagen:

![imagen4] (./images/04.png)

Más tarde, creamos 3 usuarios locales llamados: perez1, perez2 y perez3.

![imagen5] (./images/05.png)

### Instalar el servicio LTSP

A continuación, instalamos el servidor de clientes ligeros para Ubuntu. Así que ejecutamos el comando de la imagen:

![imagen6] (./images/06.png)

También instalamos el openssh-server, que en mi caso ya venía en el sistema:

![imagen7] (./images/07.png)

Y por último, creamos la imagen del sistema operativo a partir del sistema real haciendo > ltsp-build-client

## Máquina cliente para LTSP
