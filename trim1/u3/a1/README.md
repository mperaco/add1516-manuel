# LDAP - OpenSuse

## 1. Servidor LDAP

### 1.1 Preparar la máquina

Comenzamos con la instalación del servidor LDAP. En primer lugar configuraremos los parámetros de red asignándole una IP estática, el nombre del equipo correspondiente así como el dominio:

![](./images/01.png)
![](./images/02.png)

Y además, añadiremos algunas entradas al fichero `/etc/hosts`:

![](./images/03.png)

Para hacer la comprobación de que todo está correctamente configurado, ejecutamos los siguientes comandos:

![](./images/04.png)

### 1.2 Instalación del Servidor LDAP

En este apartado de la práctica, procederemos a la instalación del módulo de Yast para gestionar el servidor LDAP `yast2-auth-server`.

Una vez instalado el módulo en el panel de Yast seguiremos los siguientes pasos:

* Ir a Yast -> Servidor de autenticación -> Iniciar

![](./images/05.png)

* Tipo de servidor -> Autónomo

![](./images/06.png)

* Configuración TLS -> No habilitar

![](./images/07.png)

* Usar como nombre de dominio `dc=manuel07,dc=curso1516`

![](./images/08.png)

* No habilitar Kerberos

![](./images/09.png)

* Comprobamos la configuración final:

![](./images/10.png)

Una vez instalado, comprobamos el servicio con el comando `systemctl status slapd`:

![](./images/11.png)

Luego, instalaremos la herramienta `gq` para comprobar el contenido de la base de datos LDAP. Vemos que ya tenemos las unidades organizativas: `groups` y `people`:

![](./images/12.png)

### 1.3 Crear usuarios y grupos en LDAP

Ahora procederemos a la instalación del paquete `yast2-auth-client` que nos configurará la máquina para autenticación. Una vez instalado, accedemos a `Cliente de autenticación` a través del panel de Yast y añadimos nuestro dominio:

![](./images/13.png)

Aceptamos y a continuación añadimos el parámetro LDAP URI:

![](./images/14.png)

Ahora procedemos a la creación de usuarios y grupos de LDAP:

![](./images/15.png)
![](./images/16.png)

Y comprobamos mediante el browser LDAP `gq` la información que tenemos en la base de datos LDAP:

![](./images/17.png)

### 1.4 Autenticación

* Comprobamos que podemos entrar desde la consola en la máquina server `ldap-server07` usando los usuarios definidos en la base de datos LDAP:

![](./images/18.png)
