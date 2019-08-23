class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  #skip_load_and_authorize_resource :only => [:index, :show, :update, :destroy, :create]
  before_action :product_uniquess, only: [:show_uniquess]
  before_action :product_collar, only: [:show_typec]
  before_action :product_collar_t, only: [:show_typec]

  # GET /products
  def index
    
    @products = Product.all.select(:id, :producname, :type_product_id,:price, :description, :quantiyy, :image)
    #name of array data   
    render json: {data: @products.as_json}
  end

  # GET /products/1
  def show
    render json: @product

  end
     
    #GET /prdoducts/nameproduct
  def show_uniquess
    render json: @product
  end
     #pass type producto collar

  def show_typec
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
 
  
  # DELETE /products/1
  def destroy
    @product.destroy
    render json: @product
  end
  

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
  # pass unique product
  def product_uniquess
    @product = Product.find_by(producname: params[:producname])

  end
  # pass product collar
  def product_collar
    @product = Product.find_by(type_product_id: params[:type_product_id], id: params[:id])
  end

  def product_collar_t
    @product = Product.where(type_product_id: params[:type_product_id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_params
    params.permit(:producname, :type_product_id, :price, :description, :quantiyy, :image)
  end
end
