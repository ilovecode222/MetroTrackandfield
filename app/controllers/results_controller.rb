class ResultsController < ApplicationController
  before_action :set_result, only: %i[show edit update destroy]

  # GET /results
  def index
    @results = Result.all
  end

  # GET /results/leaderboard
  def leaderboard
    @events = Event.includes(results: :athlete).all
  end

  # GET /results/meets
  def meets
    @meets = Result.includes(:athlete, :event).group_by(&:date)
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # POST /results
  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to @result, notice: 'Result was successfully created.'
    else
      render :new
    end
  end

  # GET /results/:id/edit
  def edit
  end

  # PATCH/PUT /results/:id
  def update
    if @result.update(result_params)
      redirect_to @result, notice: 'Result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /results/:id
  def destroy
    @result.destroy
    redirect_to results_url, notice: 'Result was successfully destroyed.'
  end

  private

  def set_result
    @result = Result.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to results_url, alert: "Result not found."
  end

  def result_params
    params.require(:result).permit(:athlete_id, :event_id, :performance, :date)
  end
end
