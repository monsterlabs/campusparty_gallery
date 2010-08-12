require 'spec_helper'
describe GalleriesController do
  def mock_gallery(stubs={})
    @mock_gallery ||= mock_model(Gallery, stubs).as_null_object
  end

  before(:each) do
    mock_user = Factory(:user)
    request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end

  describe "GET index" do
    it "assigns all galleries as @galleries" do
      Gallery.stub(:all) { [mock_gallery] }
      get :index
      assigns(:galleries).should eq([mock_gallery])
    end
  end

  describe "GET show" do
    it "assigns the requested gallery as mock_gallery" do
      Gallery.stub(:find).with("37") { mock_gallery }
      get :show, :id => "37"
      assigns(:gallery).should be(mock_gallery)
    end
  end

  describe "GET new" do
    it "assigns a new gallery as mock_gallery" do
      Gallery.stub(:new) { mock_gallery }
      get :new
      assigns(:gallery).should be(mock_gallery)
    end
  end

  describe "GET edit" do
    it "assigns the requested gallery as mock_gallery" do
      Gallery.stub(:find).with("37") { mock_gallery }
      get :edit, :id => "37"
      assigns(:gallery).should be(mock_gallery)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created gallery as mock_gallery" do
        Gallery.stub(:new).with({'name' => 'New gallery'}) { mock_gallery(:save => true) }
        post :create, :gallery => {'name' => 'New gallery'}
        assigns(:gallery).should be(mock_gallery)
      end

      it "redirects to the created gallery" do
        Gallery.stub(:new) {  mock_gallery(:save => true) }
        post :create, :gallery => {}
        response.should redirect_to(gallery_url(mock_gallery))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gallery as mock_gallery" do
        Gallery.stub(:new).with({'name' => 'New gallery'}  ) {  mock_gallery(:save => false) }
        post :create, :gallery => {'name' => 'New gallery'}
        assigns(:gallery).should be(mock_gallery)
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested gallery" do
        Gallery.should_receive(:find).with("37") { mock_gallery }
        mock_gallery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :gallery => {'these' => 'params'}
      end

      it "assigns the requested gallery as @gallery" do
        Gallery.stub(:find) { mock_gallery(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:gallery).should be(mock_gallery)
      end

      it "redirects to the gallery" do
        Gallery.stub(:find) { mock_gallery(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(gallery_url(mock_gallery))
      end
    end

    describe "with invalid params" do
      it "assigns the gallery as @gallery" do
        Gallery.stub(:find) { mock_gallery(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:gallery).should be(mock_gallery)
      end

      it "re-renders the 'edit' template" do
        Gallery.stub(:find) { mock_gallery(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do

    it "destroys the requested gallery" do
      Gallery.should_receive(:find).with("37") { mock_gallery }
      mock_gallery.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the galleries list" do
      Gallery.stub(:find) { mock_gallery(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(galleries_url)
    end

  end

end
