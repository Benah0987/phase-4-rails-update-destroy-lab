class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end
  # UPDATE
  # PATCH /plants/ :id
  def update
    # updating a single plant
    plant = Plant.find_by(id: params[:id])
    # using strong params
    if plant.update(plant_params)
      render json: plant
    else
      render json: plant.errors, status: :unprocessable_entity
    end
  end
  # delete 
  def destroy
    plant = Plant.find_by(id: params[:id])

    if plant.destroy
      head :no_content
    else
      render json: plant.errors, status: :unprocessable_entity
    end
  end


  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
