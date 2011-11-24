# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# Refinery seeds

load(Rails.root.join('db', 'custom_seeds', 'user.rb').to_s)
load(Rails.root.join('db', 'custom_seeds', 'images.rb').to_s)
load(Rails.root.join('db', 'custom_seeds', 'study_categories.rb').to_s)
load(Rails.root.join('db', 'custom_seeds', 'settings.rb').to_s)
load(Rails.root.join('db', 'custom_seeds', 'pages.rb').to_s)







Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each do |file|
  puts "Loading db/seeds/#{file.split(File::SEPARATOR).last}"
  load(file)
end
