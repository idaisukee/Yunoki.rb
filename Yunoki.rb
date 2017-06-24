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
			@rotation = - @target_array.size + @in_index + 1
			@target_array.rotate(@rotation).first
		end
	end

	def modern_char
		if self.target_array == nil or self.target_array.index(@input) == nil then
			nil
		else
			@target_array[0]
		end
	end

	def index
		if self.target_array == nil or self.target_array.index(@input) == nil then
			0
		else
			@in_index = self.target_array.index(@input)
		end
	end
end

