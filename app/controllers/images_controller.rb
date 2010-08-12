class ImagesController < ApplicationController
  respond_to :html
  skip_before_filter :authenticate_user!, :only => [:index, :show ]
  
  # GET /images
  # GET /images.xml
  def index
    respond_with(@images = Image.where(:gallery_id => params[:gallery_id]).all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 5))
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    respond_with(@image = Image.find(params[:id]))
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    respond_with(@image = Image.new)
  end

  # GET /images/1/edit
  def edit
    respond_with(@image = Image.find(params[:id]))
  end

  # POST /images
  # POST /images.xml
  def create
    respond_with(@image = Image.create(params[:image]), :status => :created)
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])
    @image.update_attributes(params[:image])
    respond_with(@image, :status => :updated)
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_with(@image, :status => :deleted, :location => images_path)
  end
end
