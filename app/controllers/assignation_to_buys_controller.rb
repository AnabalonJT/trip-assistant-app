class AssignationToBuysController < ApplicationController
  before_action :set_assignation_to_buy, only: %i[ show edit update destroy ]

  # GET /assignation_to_buys or /assignation_to_buys.json
  def index
    @assignation_to_buys = AssignationToBuy.all
  end

  # GET /assignation_to_buys/1 or /assignation_to_buys/1.json
  def show
  end

  # GET /assignation_to_buys/new
  def new
    @assignation_to_buy = AssignationToBuy.new
  end

  # GET /assignation_to_buys/1/edit
  def edit
  end

  # POST /assignation_to_buys or /assignation_to_buys.json
  def create
    @assignation_to_buy = AssignationToBuy.new(assignation_to_buy_params)

    respond_to do |format|
      if @assignation_to_buy.save
        format.html { redirect_to @assignation_to_buy, notice: "Assignation to buy was successfully created." }
        format.json { render :show, status: :created, location: @assignation_to_buy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignation_to_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignation_to_buys/1 or /assignation_to_buys/1.json
  def update
    respond_to do |format|
      if @assignation_to_buy.update(assignation_to_buy_params)
        format.html { redirect_to @assignation_to_buy, notice: "Assignation to buy was successfully updated." }
        format.json { render :show, status: :ok, location: @assignation_to_buy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignation_to_buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignation_to_buys/1 or /assignation_to_buys/1.json
  def destroy
    @assignation_to_buy.destroy

    respond_to do |format|
      format.html { redirect_to assignation_to_buys_path, status: :see_other, notice: "Assignation to buy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignation_to_buy
      @assignation_to_buy = AssignationToBuy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignation_to_buy_params
      params.require(:assignation_to_buy).permit(:ingredient_id, :user_id, :trip_id, :verified)
    end
end
