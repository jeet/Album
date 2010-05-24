require 'spec_helper'

describe "/albums/new.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:album] = stub_model(Album,
      :new_record? => true,
      :title => "value for title",
      :short_name => "value for short_name"
    )
  end

  it "renders new album form" do
    render

    response.should have_tag("form[action=?][method=post]", albums_path) do
      with_tag("input#album_title[name=?]", "album[title]")
      with_tag("input#album_short_name[name=?]", "album[short_name]")
    end
  end
end
