class ProductController < ApplicationController
  def new
    @product = Product.new
  end
end