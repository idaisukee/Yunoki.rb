# -*- coding: utf-8 -*-
table = File.join(File.dirname(__FILE__), './table.dat')

parent_array = Array.new

File.open(table) do |file|
	file.each do |line|
		parent_array << line.split(' ')
	end
end

input = ARGV[0] || STDIN.gets.strip 
target_array = parent_array.select do |child_array|
	child_array.include? input
end.flatten

in_index = target_array.index(input)
out_index = 
	if in_index == target_array.size - 1 then 0
	else in_index + 1
end

print target_array[out_index]
