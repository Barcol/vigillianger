class ReportsController < ApplicationController
  before_action :check_if_melange_is_empty, only: :show

  def show
    @people = PartyGuest.where(melange: current_user.party_guest.melange)
  end

  private

  def check_if_melange_is_empty
    redirect_to new_melange_management_path, notice: "Najpierw skonfiguruj wydarzenie." unless current_user.party_guest&.melange
  end
end

