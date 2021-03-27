class AdultsController < ApplicationController
  before_action :set_adult, only: %i[ show edit update destroy ]

  # GET /adults or /adults.json
  def index
    @adults = Adult.all
  end

  # GET /adults/1 or /adults/1.json
  def show
  end

  # GET /adults/new
  def new
    @adult = Adult.new
  end

  # GET /adults/1/edit
  def edit
  end

  # POST /adults or /adults.json
  def create
    @user = User.new(params[:user])
    @adult = Adult.new(params[:patron])
    @user.role = @adult
    @adult.save
    @user.save
    sign_in_and_redirect @user
  end

  # PATCH/PUT /adults/1 or /adults/1.json
  def update
    respond_to do |format|
      if @adult.update(adult_params)
        format.html { redirect_to @adult, notice: "Adult was successfully updated." }
        format.json { render :show, status: :ok, location: @adult }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adults/1 or /adults/1.json
  def destroy
    @adult.destroy
    respond_to do |format|
      format.html { redirect_to adults_url, notice: "Adult was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adult
      @adult = Adult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adult_params
      params.fetch(:adult, {})
    end
end
