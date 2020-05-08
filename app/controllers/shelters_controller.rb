class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    shelter = Shelter.new(shelter_params)
    if shelter.save
      redirect_to shelters_path
    else
      redirect_to new_shelter_path
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.update(params[:id],shelter_params)
    if shelter.save
      redirect_to "/shelters/#{shelter.id}"
    else
      redirect_to new_shelter_path
    end
  end

  private

  # strong params method
  def shelter_params
    params.require(:shelter).permit(:name, :address, :state, :city, :zip)
  end
end
