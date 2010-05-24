require 'spec_helper'

describe "/images/edit.html.erb" do
  include ImagesHelper

  before(:each) do
    assigns[:image] = @image = stub_model(Image,
      :new_record? => false,
      :title => "value for title",
      :short_name => "value for short_name",
      :album_id => 1
    )
  end

  it "renders the edit image form" do
    render

    response.should have_tag("form[action=#{image_path(@image)}][method=post]") do
      with_tag('input#image_title[name=?]', "image[title]")
      with_tag('input#image_short_name[name=?]', "image[short_name]")
      with_tag('input#image_album_id[name=?]', "image[album_id]")
    end
  end
end
