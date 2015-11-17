#!/usr/bin/ruby
# encoding: utf-8

user=`whoami`

if user != "root\n"
	puts "El usuario no es root"
	exit
end

