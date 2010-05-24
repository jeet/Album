require 'spec_helper'

describe "/images/index.html.erb" do
  include ImagesHelper

  before(:each) do
    assigns[:images] = [
      stub_model(Image,
        :title => "value for title",
        :short_name => "value for short_name",
        :album_id => 1
      ),
      stub_model(Image,
        :title => "value for title",
        :short_name => "value for short_name",
        :album_id => 1
      )
    ]
  end

  it "renders a list of images" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for short_name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
