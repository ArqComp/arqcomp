Given /^I have no study_categories$/ do
  StudyCategory.delete_all
end

Given /^I (only )?have study_categories titled "?([^\"]*)"?$/ do |only, titles|
  StudyCategory.delete_all if only
  titles.split(', ').each do |title|
    StudyCategory.create(:name => title)
  end
end

Then /^I should have ([0-9]+) study_categor[y|ies]+?$/ do |count|
  StudyCategory.count.should == count.to_i
end
