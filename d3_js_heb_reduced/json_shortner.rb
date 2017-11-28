#!/usr/bin/env ruby
require 'json'
old_file = File.read('flare.json')
parsed_json = JSON.parse(old_file)
array_to_json = []
max = parsed_json.size - 1
range = 0..max
range.each do |count|
  break if count > 4
  names_to_keep = []
  imports_to_keep = []
  sizes_to_keep = []
  name = parsed_json[count]['name'].to_s
  size = parsed_json[count]['size'].to_i
  regex = '/(.phys.)/'
  next if name[regex.to_s]
  temp_keep = []
  names_to_keep << parsed_json[count]['name']
  sizes_to_keep << size.to_i if size
  parsed_json[count]['imports'].each do |member|
    temp_keep << member.to_s unless member[regex.to_s]
  end
  imports_to_keep << temp_keep
  deep_range = 0..names_to_keep.size - 1
  deep_range.each do |i|
    array_to_json << { name: (names_to_keep[i]).to_s,
                       size: sizes_to_keep[i],
                       imports: imports_to_keep[i] }
    puts array_to_json.inspect
    new_file = File.open('new_flare.json', 'w')
    new_file.puts array_to_json.to_json
  end
end
