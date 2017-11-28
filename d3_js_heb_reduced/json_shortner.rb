#!/usr/bin/env ruby
require 'json'
old_file = File.read('flare.json')
parsed_json = JSON.parse(old_file)
new_json_array = []
array_to_json = []
max = parsed_json.size - 1
range = 0..max
range.each do |range|
  break if range > 4
  names_to_keep = []
  imports_to_keep = []
  sizes_to_keep = []
  name = parsed_json[range]['name'].to_s
  size = parsed_json[range]['size'].to_i
  puts name.inspect
  puts '/*/**/*/*/*/'
  puts name.size
end
