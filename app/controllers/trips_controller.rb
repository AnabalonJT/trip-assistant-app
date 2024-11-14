class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy join_trip]
  before_action :check_participation_trip, only: %i[show edit update destroy]

  # GET /trips or /trips.json
  def index
    @trips = current_user.trips
  end

  # GET /trips/1 or /trips/1.json
  def show
    @recipes = Recipe.all
    @users = @trip.users.includes(:forbidden_food_users)

    @events = []
    @events << {name: "Inicio viaje", date: @trip.start_date}
    @events << {name: "Fin viaje", date: @trip.end_date}
    #@events.concat(trip.recipes.map { |recipe| { name: recipe.name, date: recipe.date } })
    @recipe_ingredients = @trip.recipes
    @ingredients = {}

    @recipe_ingredients.each do |recipe|
      recipe.calculate_ingredients(@trip).each do |ingredient, quantity|
        if @ingredients.key?(ingredient)
          @ingredients[ingredient] += quantity
        else
          @ingredients[ingredient] = quantity
        end
      end
    end
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  def add_recipe
    @trip = Trip.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    unless @trip.recipes.exists?(@recipe.id)
      if @trip.recipes << @recipe
        redirect_to trip_path(@trip), notice: 'Recipe added successfully.'
      else
        Rails.logger.debug "Failed to add recipe: #{@trip.errors.full_messages}"
        redirect_to trip_path(@trip), alert: 'Failed to add recipe.'
      end
    else
      notice = 'Recipe is already added to the trip.'
      redirect_to trip_path(@trip), notice: notice
    end
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        UserTrip.create(user: current_user, trip: @trip)
        format.html { redirect_to @trip, notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_path, status: :see_other, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def join_trip
    UserTrip.find_or_create_by(user: current_user, trip: @trip)
    redirect_to @trip
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:title, :start_date, :end_date)
    end

    def check_participation_trip
      unless @trip.users.include?(current_user)
        redirect_to trips_path, alert: 'No participas de este viaje'
      end
    end
end
