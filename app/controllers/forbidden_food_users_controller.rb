class ForbiddenFoodUsersController < ApplicationController
  before_action :set_forbidden_food_user, only: %i[ show edit update destroy ]

  # GET /forbidden_food_users or /forbidden_food_users.json
  def index
    @forbidden_food_users = ForbiddenFoodUser.all
  end

  # GET /forbidden_food_users/1 or /forbidden_food_users/1.json
  def show
  end

  # GET /forbidden_food_users/new
  def new
    @forbidden_food_user = ForbiddenFoodUser.new
  end

  # GET /forbidden_food_users/1/edit
  def edit
  end

  # POST /forbidden_food_users or /forbidden_food_users.json
  def create
    @forbidden_food_user = ForbiddenFoodUser.new(forbidden_food_user_params)

    respond_to do |format|
      if @forbidden_food_user.save
        format.html { redirect_to @forbidden_food_user, notice: "Forbidden food user was successfully created." }
        format.json { render :show, status: :created, location: @forbidden_food_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forbidden_food_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forbidden_food_users/1 or /forbidden_food_users/1.json
  def update
    respond_to do |format|
      if @forbidden_food_user.update(forbidden_food_user_params)
        format.html { redirect_to @forbidden_food_user, notice: "Forbidden food user was successfully updated." }
        format.json { render :show, status: :ok, location: @forbidden_food_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forbidden_food_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forbidden_food_users/1 or /forbidden_food_users/1.json
  def destroy
    @forbidden_food_user.destroy

    respond_to do |format|
      format.html { redirect_to forbidden_food_users_path, status: :see_other, notice: "Forbidden food user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forbidden_food_user
      @forbidden_food_user = ForbiddenFoodUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forbidden_food_user_params
      params.require(:forbidden_food_user).permit(:user_id, :ingredient_id)
    end
end
