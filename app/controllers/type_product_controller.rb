class TypeProductController < ApplicationController
    before_action :set_typeproduct, only: [:show, :update, :destroy]


  # GET /products/1
  def show
    render json: @typeproduct
  end


  # PATCH/PUT /products/1
  def update
    if @typeproduct.update(product_params)
      render json: @typeproduct
    else
      render json: @typeproduct.errors, status: :unprocessable_entity
    end
  end

#get /products  

def index
  @typeproduct = TypeProduct.all.select(:id, :nametype)

   #name of array types  
types = [
  types: @typeproduct.as_json

]
render json: types

end

 # POST /products
def create
  @typeproduct= TypeProduct.new(typeproduct_params)

  if @typeproduct.save
    render json: @typeproduct, status: :created, location: @typeproduct
  else
    render json: @typeproduct.errors, status: :unprocessable_entity
  end
end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeproduct
        @typeproduct = TypeProduct.find(params[:id])
      end
 # Only allow a trusted parameter "white list" through.
def typeproduct_params
    params.permit(:id, :nametype)
  end
end


