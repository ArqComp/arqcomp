# -*- coding: utf-8 -*-

puts 'Roles'

['Refinery', 'Superuser'].each do |role|
  Role.create!(
    :title => role
  )
end

puts 'User'

u = User.new(
  :username => 'arqcomp',
  :email => 'arqcompuff@gmail.com',
  :password => 'arqcomp123'
)

u.save!(:validate => false)

u.add_role :refinery
u.add_role :superuser 

puts 'Plugin List'

plugin_list = [
  "refinery_dashboard",
  "refinery_files",
  "refinery_images",
  "refinerycms_base",
  "refinery_core",
  "refinery_dialogs",
  "refinery_i18n",
  "refinery_generators",
  "refinery_pages",
  "updates",
  "study_categories",
  "studies",
  "events",
  "projects",
  "refinery_users",
  "refinery_settings",
]
plugin_list.each_with_index do |value, position|  
  UserPlugin.create!(
    :user_id => u.id,
    :name => value,
    :position => position
  )
end
