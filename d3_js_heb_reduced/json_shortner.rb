#!/usr/bin/env ruby
require 'json'
old_file = File.read('flare.json')
parsed_json = JSON.parse(old_file)
max = parsed_json.size - 1
range = 0..max
range.each do |member|
  break if member > 4
  name = parsed_json[member]['name'].to_s
  size = parsed_json[member]['size'].to_i
  puts name.inspect
  puts '/*/**/*/*/*/'
  puts size.inspect
end
