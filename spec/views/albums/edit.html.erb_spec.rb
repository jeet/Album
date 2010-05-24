require 'spec_helper'

describe "/albums/edit.html.erb" do
  include AlbumsHelper

  before(:each) do
    assigns[:album] = @album = stub_model(Album,
      :new_record? => false,
      :title => "value for title",
      :short_name => "value for short_name"
    )
  end

  it "renders the edit album form" do
    render

    response.should have_tag("form[action=#{album_path(@album)}][method=post]") do
      with_tag('input#album_title[name=?]', "album[title]")
      with_tag('input#album_short_name[name=?]', "album[short_name]")
    end
  end
end
