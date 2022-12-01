class ProductsController < ApplicationController

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




  private

  def product_params
    params.require(products).permit(:title, :money, :content)

  end


end