class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :edit, :update, :destroy]

  # GET /athletes
  def index
    @athletes = Athlete.all
  end

  # GET /athletes/1
  def show
  end

  # GET /athletes/new
  def new
    @athlete = Athlete.new
  end

  # GET /athletes/1/edit
  def edit
  end

  # POST /athletes
def create
  @athlete = Athlete.new(athlete_params)

  if @athlete.save
    redirect_to @athlete, notice: 'Athlete was successfully created.'
  else
    # important: respond with 422 so Turbo will update form with errors
    render :new, status: :unprocessable_entity
  end
end


  # PATCH/PUT /athletes/1
  def update
    if @athlete.update(athlete_params)
      redirect_to @athlete, notice: 'Athlete was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /athletes/1
  def destroy
    @athlete.destroy
    redirect_to athletes_url, notice: 'Athlete was successfully destroyed.'
  end

  private
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    def athlete_params
      params.require(:athlete).permit(:name, :grade, :school)
    end
end
