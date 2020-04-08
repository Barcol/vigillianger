class PartyGuestController < ApplicationController
  def edit
    @party_guest = PartyGuest.find(params[:id])
    @types = Type.where(melange: @party_guest.melange)
  end

  def update
    @party_guest = PartyGuest.find(params[:id])
    @types = Type.where(melange: @party_guest.melange)
    update_consume_preferences(params.delete(:type_ids))
    @party_guest.attributes = party_guest_params
    if @party_guest.errors.full_messages.empty? && @party_guest.save
      redirect_to edit_melange_management_path, notice: "Poprawnie zedytowano użytkownika"
    else
      render "edit"
    end
  end

  private

  def update_consume_preferences(type_ids)
    ConsumePreference.where(party_guest: @party_guest).where.not(type: type_ids).each do |preference|
      if Product.find_by(party_guest: preference.party_guest, type: preference.type)
        @party_guest.errors.add(:preferences, "Nie możesz odpiąć użytkownika od kategorii, w której zakupił już produkt!")
      else
        preference.destroy
      end
    end
    type_ids.each do |type_id|
      ConsumePreference.find_or_create_by(party_guest: @party_guest, type_id: type_id)
    end
  end

  def party_guest_params
    params.require(:party_guest).permit(:name, :types)
  end
end