module ApplicationHelper
  def get_menu_data
    current_user.party_guest.types.map { |type| {id: type.id, name: type.name} }
  end
end
