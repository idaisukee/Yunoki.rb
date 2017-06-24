require File.join(File.dirname(__FILE__), './Yunoki.rb')

input = ARGV[0] || STDIN.gets.strip
print Yunoki.new(input).modern_char || input
