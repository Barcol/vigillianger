module ApplicationHelper
  def get_menu_data
    current_user.party_guest.types.map{ |type| {id: type.id, name: type.name}}
  end

  def number_to_currency(num)
    num = num.to_s
    num[-2] = "," + num[-2]
    "#{num} #{I18n.t('currency')}"
  end
end
