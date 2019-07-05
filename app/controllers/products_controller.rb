class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :product_uniquess, only: [:show_uniquess]

  # GET /products
  def index
    @products = Product.all.select(:id, :producname, :price, :description)

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end
  def show_uniquess
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
   
    def product_uniquess
      @product = Product.find_by(producname: params[:producname])

    end
  
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:producname, :price, :description)
    end
end
