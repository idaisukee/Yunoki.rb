# -*- coding: utf-8 -*-

class Yunoki
	def initialize(input)
		@input = input
		@table = File.join(File.dirname(__FILE__), './table.dat')

		@parent_array = Array.new

		File.open(@table) do |file|
			file.each do |line|
				@parent_array << line.split(' ')
			end
		end

	end

	def target_array
		@target_array = @parent_array.select do |child_array|
			child_array.include? @input
		end.flatten
	end

	def next_char
		if self.target_array == nil or self.target_array.index(@input) == nil then
			nil
		else
			@in_index = self.target_array.index(@input)
			@out_index = 
				if @in_index == self.target_array.size - 1 then 0
				else @in_index + 1
				end
			@target_array[@out_index]
		end
	end

	def modern_char
		if self.target_array == nil or self.target_array.index(@input) == nil then
			nil
		else
			@target_array[0]
		end
	end
		
end

