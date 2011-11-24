if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'projects').blank?
      user.plugins.create(:name => 'projects',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
