#!/usr/bin/env ruby
require 'json'
require 'csv'
require 'set'
csv_values = {}
dimensions_arr = []
dimensions_set = Set.new
dependency_arr = []
csv_rows_arr = []
csv_rows_hash = {}
dimensions_hash = {}
CSV.foreach('dependency.csv', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  # csv_values[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
# :TODO handle deep attributes for depends_on strength
  dimensions_hash = dimensions_hash.merge({:"dim" => row[0]})
  dimensions_set.add(row[0])
  dimensions_arr << row[0]
  dependency_arr << row[1]
end
dimensions_set.each do |set_member|
  temp_dependencies_arr = []
  range = 0..dimensions_arr.size
  range.each do |range|
  if set_member == dimensions_arr[range]
    if dependency_arr[range]
    temp_dependencies_arr << 'dependency.' + dependency_arr[range].to_s
    end
  end
  end
  csv_rows_arr << {:"dimension" => 'dependency.' + set_member,
                   :"depends_on" => temp_dependencies_arr}
end
new_file = File.open('dependency.json', 'w')
new_file.puts csv_rows_arr.to_json
