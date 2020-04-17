class MelangeManagementsController < ApplicationController
  before_action :check_if_melange_is_present, only: [:new, :create]
  before_action :check_if_melange_is_empty, only: [:edit, :update]

  def edit
    @melange = current_user.party_guest.melange
    @participants = PartyGuest.where(melange: @melange)
    @types = Type.where(melange: @melange)
  end

  def new
    @melange = Melange.new
    @melange.types.build
    @melange.party_guests.build
    @melange.party_guests.map { |pg| pg.build_user }
  end

  def create
    @melange = Melange.new(new_melange_params)
    if @melange.save!
      PartyGuest.create(user: current_user, name: params[:username], melange: @melange)
      params[:melange][:party_guests_attributes].each do |party_guest_key, party_guest_value|
        user = User.find_by(email: party_guest_value[:email]) || User.create(email: party_guest_value[:email],
                                                                             role: role_to_symbol(party_guest_value[:role]),
                                                                             password: "password")
        pg = PartyGuest.find_by(name: party_guest_value[:name], melange: @melange)
        pg.update_attributes(user_id: user.id) unless pg.user
      end
      current_user.party_guest.melange.party_guests.each do |party_guest|
        current_user.party_guest.melange.types.each do |type|
          ConsumePreference.create(party_guest: party_guest, type: type)
        end
      end
      redirect_to root_path, notice: "Wydarzenie skonfigurowane prawidłowo!"
    else
      render :new
    end
  end

  def update
    @melange = current_user.party_guest.melange
    if @melange.update(melange_management_params)
      redirect_to edit_melange_management_path,
                  notice: "Dane melanżu zaktualizowane poprawnie"
    else
      render :edit
    end
  end

  private

  def check_if_melange_is_present
    redirect_to root_path, notice: "Melanż już skonfigurowany! Użyj panelu zarządzania." if current_user.party_guest&.melange
  end

  def check_if_melange_is_empty
    redirect_to new_melange_management_path, notice: "Najpierw skonfiguruj wydarzenie." unless current_user.party_guest&.melange
  end

  def role_to_symbol(role)
    return :guest if role == "0"
    :organizer
  end

  def new_melange_params
    params
        .require(:melange)
        .permit(:name, :event_date,
                party_guests_attributes: [:name, :email, :role, :_destroy],
                types_attributes: [:name])
  end

  def melange_management_params
    params.require(:melange).permit(:name, :event_date)
  end
end
