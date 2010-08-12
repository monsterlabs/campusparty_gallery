class GalleriesController < ApplicationController
  respond_to :html
  # GET /galleries
  # GET /galleries.xml
  def index
    respond_with(@galleries = Gallery.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 5))
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    respond_with(@gallery = Gallery.find(params[:id]))
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    respond_with(@gallery = Gallery.new)
  end

  # GET /galleries/1/edit
  def edit
    respond_with(@gallery = Gallery.find(params[:id]))
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    respond_with(@gallery = Gallery.create(params[:gallery]), :status => :created)
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes(params[:gallery])
    respond_with(@gallery, :status => :updated)
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    respond_with(@gallery, :status => :deleted, :location => galleries_path)
  end
end
