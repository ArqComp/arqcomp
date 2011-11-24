if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'updates').blank?
      user.plugins.create(:name => 'updates',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
