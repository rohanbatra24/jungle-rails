class ProductsController < ApplicationController

  def index
    puts 'here'
    @products = Product.all.order(created_at: :desc)
    
  end

  def show
    @product = Product.find params[:id]
    @products = Product.all.order(created_at: :desc)
  end

end
