# Puppet en Debian - Lubuntu (Linux)

## 1. Introducción

Puppet es una herramienta diseñada para administrar la configuración de sistemas Unix-like y de Microsoft Windows de forma declarativa.

En esta práctica, he implementado el servicio Puppet (servidor y cliente) en máquinas reales. Un servidor (configurado en remoto a través de ssh) y un cliente (un ordenador del aula).

Las direcciones IP de las máquinas en este caso serán:

* Leela (servidor): 172.20.1.2
* PC04 (aula108): 172.18.4.0

## 2. Instalación y configuración del SERVER

Como he dicho en la introducción, accedemos al servidor leela desde mi propio ordenador de clase para realizar las configuraciones oportunas. En primer lugar, modificaremos el fichero `/etc/hosts` añadiendole la línea correspondiente al cliente pc04:

![](./images/06.png)

Hacemos ping a la máquina pc04:

![](./images/07.png)

### Primera versión del fichero pp

Instalamos el paquete del servidor Puppet:

![](./images/08.png)

Y creamos las siguientes carpetas y ficheros necesarios para la configuración:

![](./images/10.png)

A continuación, modificamos el fichero site.pp:

![](./images/12.png)

Y modificamos también el contenido del fichero hostlinux1.pp:

![](./images/13.png)

Y por último reiniciamos el servicio en el servidor:

![](./images/14.png)

## 3. Instalación y configuración del CLIENTE

Antes que nada modificamos el fichero `/etc/hosts` y le añadimos la línea correspondiente al servidor:

![](./images/05.png)

Ahora procederemos a configurar la máquina cliente (pc04). En primer lugar instalamos el servicio con el comando `apt-get install puppet`. Una vez instalado, el cliente puppet debe ser informado de quién será su master. Entonces añadimos en el fichero `/etc/puppet/puppet.conf` la línea `server=leela.servidor`:

![](./images/15.png)

Por último, elimino los paquetes que instalará el servidor de Puppet en el cliente para realizar la comprobación:

![](./images/17.png)

Y reinicio el servicio: `/etc/init.d/puppet restart`

> NOTA:
> Antes de continuar con los intercambios de los certificados, desactivamos el cortafuegos en el servidor leela y cambiamos el paquete de puppetmaster por puppetserver, es decir, desintalamos el paquete puppetmaster e instalamos el paquete puppetserver en el servidor. Y realizamos las mismas configuraciones anteriores.
> Si nos da error en los permisos, lo solucionamos dando permisos al directorio puppet en el master y reiniciando el servicio.

## 4. Aceptar certificado

## 5. Segunda versión del fichero ".pp"

## 6. Cliente puppet Windows

