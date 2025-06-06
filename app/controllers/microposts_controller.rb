class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[ show edit update destroy like]

  before_action :set_user_options, only: %i[ new edit create ]

  # GET /microposts or /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1 or /microposts/1.json
  def show
  end

  def like

    like = Like.find_by(micropost_id:@micropost.id,user_id:current_user.id)
    if like.nil?
      Like.create(micropost_id:@micropost.id,user_id:current_user.id)
      redirect_to microposts_path, status: :see_other, notice: "Micropost was successfully liked."
    else
      redirect_to microposts_path, status: :see_other, error: "You have already liked the post"
    end
    
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts or /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1 or /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: "Micropost was successfully updated." }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @micropost.destroy!

    respond_to do |format|
      format.html { redirect_to microposts_path, status: :see_other, notice: "Micropost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Creates and sets the names and user_if for micropost form
    def set_user_options
      @select_options = [["Select User",nil]] + User.all.map{ |user| [user.name,user.id] }
    end 

    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
