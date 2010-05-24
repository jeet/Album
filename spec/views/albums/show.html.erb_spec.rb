require 'spec_helper'

describe "/albums/show.html.erb" do
  include AlbumsHelper
  before(:each) do
    assigns[:album] = @album = stub_model(Album,
      :title => "value for title",
      :short_name => "value for short_name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ short_name/)
  end
end
