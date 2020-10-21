module PartyGuestsHelper
  def permitted_types
    Type.accessible_by(current_ability).map { |type| [type.name, type.id] }
  end
end

