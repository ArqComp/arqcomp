if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'study_categories').blank?
      user.plugins.create(:name => 'study_categories',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
