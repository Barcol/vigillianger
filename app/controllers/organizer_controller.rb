class OrganizerController < ApplicationController
  def index
    melange = current_user.party_guest.melange
    @participants = PartyGuest.where(melange: melange)
    @types = ConsumePreference.where(party_guest: @participants).map { |type|
      [type.type.name, type.type.id]
    }
  end
end
