if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'studies').blank?
      user.plugins.create(:name => 'studies',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
