require 'spec_helper'

describe Update do

  def reset_update(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @update.destroy! if @update
    @update = Update.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_update
  end

  context "validations" do
    
    it "rejects empty title" do
      Update.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_update
      Update.new(@valid_attributes).should_not be_valid
    end
    
  end

end