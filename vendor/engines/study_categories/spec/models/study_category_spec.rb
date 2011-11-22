require 'spec_helper'

describe StudyCategory do

  def reset_study_category(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @study_category.destroy! if @study_category
    @study_category = StudyCategory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_study_category
  end

  context "validations" do
    
    it "rejects empty name" do
      StudyCategory.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_study_category
      StudyCategory.new(@valid_attributes).should_not be_valid
    end
    
  end

end