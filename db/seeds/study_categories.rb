if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'study_categories').blank?
      user.plugins.create(:name => 'study_categories',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Study Categories',
    :link_url => '/study_categories',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/study_categories(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end