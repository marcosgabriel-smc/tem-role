class CollectivesController < ApplicationController
  before_action :set_collective, only: %i[show edit update destroy]
  before_action :authorize_user, except: %i[index]
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /collectives or /collectives.json
  def index
    @collectives = policy_scope(Collective)
  end

  # GET /collectives/1 or /collectives/1.json
  def show
  end

  # GET /collectives/new
  def new
    @collective = Collective.new
  end

  # POST /collectives or /collectives.json
  def create
    @collective = Collective.new(collective_params)
    @collective.owner = current_user
    @collective.genre_ids = params[:collective][:genre_ids]

    if @collective.save
      redirect_to collective_url(@collective), notice: "Collective was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /collectives/1/edit
  def edit
  end

  # PATCH/PUT /collectives/1 or /collectives/1.json
  def update
    if @collective.update(collective_params)
      redirect_to collective_url(@collective), notice: "Collective was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /collectives/1 or /collectives/1.json
  def destroy
    @collective.destroy

    redirect_to collectives_url, notice: "Collective was successfully destroyed."
  end

  private

  def authorize_user
    collective = @collective || Collective
    authorize collective
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_collective
    @collective = Collective.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collective_params
    params.require(:collective).permit(:name, :description, :city, :state, :genre_ids, :banner, :logo)
  end
end
