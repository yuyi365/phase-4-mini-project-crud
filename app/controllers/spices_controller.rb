class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

  #GET /spices (index)
  def index
    render json: Spice.all, status: :ok
  end

  #   def show
  #     spice = find_spice
  #     render json: spice
  #   end

  #POST /spices (create)
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  #PATCH /spices/:id (update)
  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice, status: :accepted
  end

  #DELETE /spices/:id (destroy)
  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def find_spice
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def record_not_found_response
    render json: { error: 'spice not found' }, status: :not_found
  end
end
