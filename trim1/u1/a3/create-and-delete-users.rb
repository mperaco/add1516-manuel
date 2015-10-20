#!/usr/bin/ruby
# encoding: utf-8

user=`whoami`

if user != "root"
	puts "El usuario no es root"
	exit
end

file=`cat userslist.txt`
fils=file.split("\n")
