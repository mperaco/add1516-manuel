#!/usr/bin/ruby
# encoding: utf-8

user=`whoami`

if user != "root\n"
	puts "El usuario no es root"
	exit
end

file=`cat software-list.txt`
filas=file.split("\n")

filas.each do |linea|
	datos=linea.split(":")
	
	comprobacion=`aptitude search #{datos[0]} | grep -w "^i   #{datos[0]}"`
	
	if datos[1] == "remove" || datos[1] == "r"
		
		if comprobacion == ""
			puts "No se puede eliminar el paquete #{datos[0]} porque no está instalado."
		else
			system("apt-get -y purge #{datos[0]}")
			puts "Se ha eliminado el paquete #{datos[0]} del sistema."
		end
	
	elsif datos[1] == "install" || datos[1] == "i"
		
		if comprobacion == ""
			system("apt-get -y install #{datos[0]}")
			puts "Se ha instalado el paquete #{datos[0]} en el sistema."
		else
			puts "El paquetes #{datos[0]} ya está instalado."
		end
	end
end
