module ApplicationHelper
  def get_menu_data
    if current_user.party_guest&.types
      current_user.party_guest.types.map { |type| {id: type.id, name: type.name} }
    else
      []
    end
  end

  def calculate_mean_price (set, number_of_people)
    set.inject { |sum, el| sum + el }.to_f / number_of_people
  end
end
