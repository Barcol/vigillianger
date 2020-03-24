class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params.merge(party_guest: current_user.party_guest))
    redirect_to shop_list_path(@product.type)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :type_id)
  end
end