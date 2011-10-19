Given /^I have no studies$/ do
  Study.delete_all
end

Given /^I (only )?have studies titled "?([^\"]*)"?$/ do |only, titles|
  Study.delete_all if only
  titles.split(', ').each do |title|
    Study.create(:title => title)
  end
end

Then /^I should have ([0-9]+) stud[y|ies]+?$/ do |count|
  Study.count.should == count.to_i
end
