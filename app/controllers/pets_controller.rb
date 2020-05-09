class PetsController < ApplicationController

  def index
    @pets =
    if shelter_id
      Pet.where(shelter_id: shelter_id)
    else
      Pet.all
    end
  end

  def show
     @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new(shelter_id: params["shelter_id"])
  end

  def create
    # pet = Pet.new(pet_params)
    pet = Pet.new(
      image: params["pet"]["image"],
      name: params["pet"]["name"],
      approximate_age: params["pet"]["approximate_age"],
      sex: params["pet"]["sex"],
      description: params["pet"]["description"],
      shelter_id: params["shelter_id"],
      adoptable: "Yes"
    )
    if pet.save
      redirect_to "/shelters/#{shelter_id}/pets"
    else
      redirect_to "/shelters/#{shelter_id}/pets/new"
    end
  end

  def shelter_id
    params.permit(:shelter_id)[:shelter_id]
  end

  # private
  #
  # def pet_params
  #   params.require(:pet).permit(:image, :name, :description, :approximate_age, :sex)
  # end
end
