require 'spec_helper'

describe "/albums/index.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:albums] = [
      stub_model(Album,
        :title => "value for title",
        :short_name => "value for short_name"
      ),
      stub_model(Album,
        :title => "value for title",
        :short_name => "value for short_name"
      )
    ]
  end

  it "renders a list of albums" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for short_name".to_s, 2)
  end
end
