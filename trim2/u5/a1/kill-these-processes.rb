#!/usr/bin/ruby
# encoding: utf-8

require 'rainbow'

user=`whoami`

if user != "root\n"
	puts "El usuario no es root"
	exit
end

system("touch state.running")

def controlar_procesos (name, action)

	comprobacion=`ps -ef | grep #{name} | grep -v grep | awk '{print $2}'`
	pid=comprobacion.split("\n")

	if action == "kill" || action == "k" || action == "remove" || action == "r"
	
		pid.each do |aux|
		
			if comprobacion != ""
				system("kill -9 #{aux}")
				puts Rainbow("_KILL_: Proceso #{name} eliminado con PID #{aux}.").color(:red)
			end
			
		end
	
	elsif action == "notify" || action == "n"
		
		if comprobacion != ""
			puts Rainbow("NOTICE: Proceso #{name} en ejecucion").color(:green)
		end
		
	end
	
end

file=`cat processes-black-list.txt`
filas=file.split("\n")

while (File.exist?"state.running") do

	filas.each do |linea|
		
		datos=linea.split(":")

		controlar_procesos(datos[0], datos[1])
		
	end
	
	sleep(5)

end
