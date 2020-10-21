class PartyGuestDecorator < ApplicationDecorator
  delegate_all

  def products_names(product_type_id)
    h.sanitize(object.products.where(type_id: product_type_id).map do |product|
      product.name
    end.join("<br/>"))
  end

  def products_prices(product_type_id)
    h.sanitize(object.products.where(type_id: product_type_id).map do |product|
      h.number_to_currency(product.price / 100.0)
    end.join("<br/>"))
  end
end
