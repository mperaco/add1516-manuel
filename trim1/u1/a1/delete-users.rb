# !/usr/bin/ruby 
# encoding: utf-8

resultado=`cat userslist.txt`

users=resultado.split("\n")

users.each do |user|
	system("userdel -r #{user}")
	puts "Se ha borrado el usuario: #{user}"
end
