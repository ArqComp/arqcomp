Given /^I have no projects$/ do
  Project.delete_all
end

Given /^I (only )?have projects titled "?([^\"]*)"?$/ do |only, titles|
  Project.delete_all if only
  titles.split(', ').each do |title|
    Project.create(:title => title)
  end
end

Then /^I should have ([0-9]+) projects?$/ do |count|
  Project.count.should == count.to_i
end
