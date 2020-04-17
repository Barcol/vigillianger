class TypesController < ApplicationController
  def edit
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
  end

  def create
    params[:type] = params[:type].merge(melange_id: current_user.party_guest.melange.id)
    p params[:type]
    @type = Type.new(type_params)
    if @type.save!
      redirect_to edit_melange_management_path, notice: "Typ dodany prawidłowo"
    else
      render :new
    end
  end

  def update
    @type = Type.find(params[:id])
    @type.attributes = type_params
    if @type.save
      redirect_to edit_melange_management_path, notice: "Typ zedytowany prawidłowo"
    else
      render :edit
    end
  end

  private

  def type_params
    params.require(:type).permit(:name, :melange_id)
  end
end


