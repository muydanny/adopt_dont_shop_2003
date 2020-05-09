class PetsController < ApplicationController
  def index
    @pets =
    if shelter_id
      Pet.where(shelter_id: shelter_id)
    else
      Pet.all
    end
  end

  def shelter_id
    params.permit(:shelter_id)[:shelter_id]
  end
end
