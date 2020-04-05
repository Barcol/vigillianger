class MelangeManagementsController < ApplicationController
  def edit
    @melange = current_user.party_guest.melange
    @participants = PartyGuest.where(melange: @melange)
  end

  def update
    @melange = current_user.party_guest.melange
    if @melange.update(melange_management_params)
      redirect_to root_path,
                  notice: I18n.t("notice.candidate_user.updated")
    else
      render :edit
    end
  end

  private

  def melange_management_params
    params.require(:melange).permit(:name, :event_date)
  end
end
