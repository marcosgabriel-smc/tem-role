class CollectivesController < ApplicationController
  before_action :set_collective, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /collectives or /collectives.json
  def index
    @collectives = Collective.all
  end

  # GET /collectives/1 or /collectives/1.json
  def show
  end

  # GET /collectives/new
  def new
    @collective = Collective.new
  end

  # GET /collectives/1/edit
  def edit
  end

  # POST /collectives or /collectives.json
  def create
    @collective = Collective.new(collective_params)

    respond_to do |format|
      if @collective.save
        format.html { redirect_to collective_url(@collective), notice: "Collective was successfully created." }
        format.json { render :show, status: :created, location: @collective }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectives/1 or /collectives/1.json
  def update
    respond_to do |format|
      if @collective.update(collective_params)
        format.html { redirect_to collective_url(@collective), notice: "Collective was successfully updated." }
        format.json { render :show, status: :ok, location: @collective }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectives/1 or /collectives/1.json
  def destroy
    @collective.destroy

    respond_to do |format|
      format.html { redirect_to collectives_url, notice: "Collective was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collective
    @collective = Collective.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collective_params
    params.fetch(:collective, {})
  end
end
