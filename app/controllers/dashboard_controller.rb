class DashboardController < ApplicationController
  def index
    if current_user.party_guest&.melange
      @organizers = []
      PartyGuest.where(melange: current_user.party_guest.melange).each do |pg|
        @organizers.append(pg.name) if pg.user.organizer?
      end
    end
  end
end
