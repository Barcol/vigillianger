class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    if params[:self_assign]
      @product = Product.create(product_params.merge(party_guest: current_user.party_guest))
    else
      @product = Product.create(product_params)
    end
    redirect_to shop_list_path(@product.type), notice: "Mordo, wyszło git"
  end

  def assign
    @product = Product.find(params[:product_id])
    @product.update_attribute(:party_guest, current_user.party_guest)
    redirect_to shop_list_path(@product.type), notice: "Mordo, wyszło git"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :type_id, :self_assign)
  end
end