class RecipeTripsController < ApplicationController
  before_action :set_recipe_trip, only: %i[ show edit update destroy ]

  # GET /recipe_trips or /recipe_trips.json
  def index
    @recipe_trips = RecipeTrip.all
  end

  # GET /recipe_trips/1 or /recipe_trips/1.json
  def show
  end

  # GET /recipe_trips/new
  def new
    @recipe_trip = RecipeTrip.new
  end

  # GET /recipe_trips/1/edit
  def edit
  end

  # POST /recipe_trips or /recipe_trips.json
  def create
    @recipe_trip = RecipeTrip.new(recipe_trip_params)

    respond_to do |format|
      if @recipe_trip.save
        format.html { redirect_to @recipe_trip, notice: "Recipe trip was successfully created." }
        format.json { render :show, status: :created, location: @recipe_trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_trips/1 or /recipe_trips/1.json
  def update
    respond_to do |format|
      if @recipe_trip.update(recipe_trip_params)
        format.html { redirect_to @recipe_trip, notice: "Recipe trip was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_trips/1 or /recipe_trips/1.json
  def destroy
    @recipe_trip.destroy

    respond_to do |format|
      format.html { redirect_to recipe_trips_path, status: :see_other, notice: "Recipe trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_trip
      @recipe_trip = RecipeTrip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_trip_params
      params.require(:recipe_trip).permit(:recipe_id, :trip_id)
    end
end
