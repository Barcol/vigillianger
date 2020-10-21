class ShopListController < ApplicationController
  def show
    @product_type = Type.find(params[:id])
    @party_guests = @product_type.party_guests.decorate
    @products = @product_type.products
  end
end
