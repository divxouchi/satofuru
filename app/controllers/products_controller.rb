class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def index
    @products = Product.all

    render json:@products
  end

  def create
    @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
    
  end

  def destroy
    @product.destroy
    render json: { 
      status: 'SUCCESS', 
      message: 'Deleted the product'
      
    }

  end

  private

  def product_params
    params.require(products).permit(:title, :money, :content)

  end

  def set_product
    @product = Product.find(params[:id])
  end



end