Given /^I have no updates$/ do
  Update.delete_all
end

Given /^I (only )?have updates titled "?([^\"]*)"?$/ do |only, titles|
  Update.delete_all if only
  titles.split(', ').each do |title|
    Update.create(:title => title)
  end
end

Then /^I should have ([0-9]+) updates?$/ do |count|
  Update.count.should == count.to_i
end
