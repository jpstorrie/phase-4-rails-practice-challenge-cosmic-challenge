class ScientistsController < ApplicationController
  before_action :set_scientist, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /scientists
  def index
    @scientists = Scientist.all

    render json: @scientists
  end

  # GET /scientists/1
  def show
    render json: @scientist, serializer: ScientistWithMissionsSerializer
  end

  # POST /scientists
  def create
    @scientist = Scientist.new(scientist_params)

    if @scientist.save
      render json: @scientist, status: :created, location: @scientist
    else
      render json: @scientist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scientists/1
  def update
    if @scientist.update(scientist_params)
      render json: @scientist
    else
      render json: @scientist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scientists/1
  def destroy
    @scientist.destroy
  end

  private
    def record_not_found
      render json: { error: "Scientist not found"}, status: :unprocessable_entity
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_scientist
      @scientist = Scientist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scientist_params
      params.require(:scientist).permit(:name, :field_of_study, :avatar)
    end
end
