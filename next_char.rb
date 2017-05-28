require File.join(File.dirname(__FILE__), './oYunoki.rb')

input = ARGV[0] || STDIN.gets.strip
print Yunoki.new(input).next_char || input
