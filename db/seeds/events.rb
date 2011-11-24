if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'events').blank?
      user.plugins.create(:name => 'events',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
