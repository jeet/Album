require 'spec_helper'

describe Album do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :short_name => "value for short_name"
    }
  end

  it "should create a new instance given valid attributes" do
    Album.create!(@valid_attributes)
  end
end
