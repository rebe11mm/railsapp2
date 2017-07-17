require 'rails_helper'

describe ProductsController, :type => :controller do
  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully and renders index template' do
      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

  context "GET #new" do 
    it "assigns a new Product to @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end   
  end

  context "GET #edit" do
    before do 
      @product = FactoryGirl.create(:product)
    end

    it "assigns the requested product to @product" do
      get :edit, params: {id: @product}
      expect(assigns(:product)).to eq @product
    end

    it "renders the :edit template" do
      get :edit, params: {id: @product}
      expect(response).to render_template :edit
    end
  end

#connect to redis server!
  context "GET #show" do
    before do 
      @product = FactoryGirl.create(:product)
    end

    it "renders the :show template" do
      get :show, params: {id: @product}
      expect(response).to render_template :show  
    end
  end

  context "DELETE #destroy" do
    before do 
      @product = FactoryGirl.create(:product)      
    end

    it "redirects to products#index" do
      delete :destroy, params: {id: @product}
      expect(response).to redirect_to products_url
    end 
  end

  context "POST #create" do
    it "is a valid product" do
    @product = FactoryGirl.build(:product, name: "newbike")
    expect(@product).to be_valid
    end
  end

  context "PUT #update" do
    before do 
      @product = FactoryGirl.create(:product)      
    end

    it "successfully updates product price" do
      @attr = { :name => @product.name, :id => @product.id, :price => "19" }
      put :update, params: { :id => @product.id, :product => @attr }
      @product.reload
      expect(@product.price).to eq 19
    end
  end

end