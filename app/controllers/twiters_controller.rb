class TwitersController < ApplicationController
  before_action :set_twiter, only: %i[ show edit update destroy ]

# GET /twiters or /twiters.json
def index
  @pagy, @twiters = pagy(Twiter.all)

  if params[:twiter].present?
    @twiters = @twiters.search_full_text(params[:twiter])
  end
end

  # GET /twiters/1 or /twiters/1.json
  def show
  end

  # GET /twiters/new
  def new
    @twiter = Twiter.new
  end

  # GET /twiters/1/edit
  def edit
  end

  # POST /twiters or /twiters.json
  def create
    @twiter = Twiter.new(twiter_params)

    respond_to do |format|
      if @twiter.save
        format.html { redirect_to twiter_url(@twiter), notice: "Twiter was successfully created." }
        format.json { render :show, status: :created, location: @twiter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twiters/1 or /twiters/1.json
  def update
    respond_to do |format|
      if @twiter.update(twiter_params)
        format.html { redirect_to twiter_url(@twiter), notice: "Twiter was successfully updated." }
        format.json { render :show, status: :ok, location: @twiter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twiters/1 or /twiters/1.json
  def destroy
    @twiter.destroy

    respond_to do |format|
      format.html { redirect_to twiters_url, notice: "Twiter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twiter
      @twiter = Twiter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twiter_params
      params.require(:twiter).permit(:description, :user_name)
    end
end
