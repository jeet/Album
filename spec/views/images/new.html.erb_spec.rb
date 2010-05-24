require 'spec_helper'

describe "/images/new.html.erb" do
  include ImagesHelper

  before(:each) do
    assigns[:image] = stub_model(Image,
      :new_record? => true,
      :title => "value for title",
      :short_name => "value for short_name",
      :album_id => 1
    )
  end

  it "renders new image form" do
    render

    response.should have_tag("form[action=?][method=post]", images_path) do
      with_tag("input#image_title[name=?]", "image[title]")
      with_tag("input#image_short_name[name=?]", "image[short_name]")
      with_tag("input#image_album_id[name=?]", "image[album_id]")
    end
  end
end
