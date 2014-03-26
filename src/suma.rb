#!/usr/bin/env ruby
#encoding utf8

class Array
	def sum
		return first if size < 2

		self[0 .. size/2-1].sum + self[size/2 .. size - 1].sum
	end
end

if __FILE__ == $0
  puts "Introduce array: "
  line = gets.chomp
  array = line.split.map(&:to_i)

  puts "Suma: #{array.sum}."
end