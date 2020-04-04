class MelangeManagementsController < ApplicationController
  def show
    @melange = current_user.party_guest.melange
  end
end
