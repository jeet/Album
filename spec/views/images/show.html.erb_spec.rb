require 'spec_helper'

describe "/images/show.html.erb" do
  include ImagesHelper
  before(:each) do
    assigns[:image] = @image = stub_model(Image,
      :title => "value for title",
      :short_name => "value for short_name",
      :album_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ short_name/)
    response.should have_text(/1/)
  end
end
