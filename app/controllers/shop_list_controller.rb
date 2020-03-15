class ShopListController < ApplicationController
  def show
    @product_type = Type.find(params[:id])
  end
end
