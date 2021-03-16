source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'json', '~> 2.3.0'
gem 'rubocop', '~> 0.49.0', require: false
gem "rake", ">= 12.3.3"
