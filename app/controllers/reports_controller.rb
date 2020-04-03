class ReportsController < ApplicationController
  def show
    @people = PartyGuest.where(melange: current_user.party_guest.melange)
  end
end

