class ImagesController < ApplicationController
  require "pp"
  # GET /images
  # GET /images.xml
  before_filter :find_album , :only => [:index,:new,:show]
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = @album.images.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end                                                                       




  def add_images
   @album = Album.find(params[:album_id] )
   image_ids =  @album.album_images.map &:image_id
  
   @images = Image.find(:all,:conditions => [ "id NOT IN (?)", image_ids ]  )





    if request.post?
        album_images = Hash.new
        @image_ids =  params[:album_image][:image_ids]
        album_images[:album_id] = params[:album_id]
        @image_ids.each do |image_id|
        album_images[:image_id] = image_id
        @album_image = AlbumImage.new(album_images)

       @album_image.save

        end


         respond_to do |format|
          flash[:notice] = 'Image was successfully added.'
        #format.html { redirect_to(album_image_url(@image.album_id,@image)  ) }
        format.html { redirect_to(album_path(@album_image.album_id)) }
        format.xml  { render :xml => @album_image, :status => :created, :location => @album_image }



     end


















      end
    end









  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
            AlbumImage.create(:image_id => @image.id,:album_id => params[:image][:album_id])
        flash[:notice] = 'Image was successfully created.'
        #format.html { redirect_to(album_image_url(@image.album_id,@image)  ) }
        format.html { redirect_to(album_path(@image.album_id)     ) }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(album_path(@image.album_id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(album_url(@image.album_id)) }
      format.xml  { head :ok }
    end
  end


  private


  def find_album
   @album =    Album.find(params[:album_id] )
    

  end
end
