class PartyGuestController < ApplicationController
  def edit
    @party_guest = PartyGuest.find(params[:id])
  end
end