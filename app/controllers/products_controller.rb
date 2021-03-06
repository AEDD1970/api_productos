class ProductsController < AuthorizeController
  before_action :set_product, only: [:show, :update, :destroy]
  #skip_load_and_authorize_resource :only => [:index, :show, :update, :destroy, :create]
  before_action :product_uniquess, only: [:show_uniquess]


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
    if params[:type_product_id].present?
      product_collar_t
    else
    end
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
    @product = Product.find_by(id: params[:id])

  end
  # pass product collar/pulsera/anillo
  def product_collar_t
    @product = Product.where(type_product_id: params[:type_product_id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_params
    params.permit(:producname, :type_product_id, :price, :description, :quantiyy, :image)
  end
end
