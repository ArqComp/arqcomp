require 'spec_helper'

describe Study do

  def reset_study(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @study.destroy! if @study
    @study = Study.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_study
  end

  context "validations" do
    
    it "rejects empty title" do
      Study.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_study
      Study.new(@valid_attributes).should_not be_valid
    end
    
  end

end