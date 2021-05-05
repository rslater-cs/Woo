class TutorClientRelationshipsController < ApplicationController
  before_action :set_tutor_client_relationship, only: %i[ show edit update destroy ]

  # GET /tutor_client_relationships or /tutor_client_relationships.json
  def index
    @tutor_client_relationships = TutorClientRelationship.all
  end

  # GET /tutor_client_relationships/1 or /tutor_client_relationships/1.json
  def show
    @tutor_client_relationship = TutorClientRelationship.find(params[:id])
  end

  # GET /tutor_client_relationships/new
  def new
    @tutor_client_relationship = TutorClientRelationship.new
  end

  # GET /tutor_client_relationships/1/edit
  def edit
  end

  # POST /tutor_client_relationships or /tutor_client_relationships.json
  def create
    @tutor_client_relationship = TutorClientRelationship.new(tutor_client_relationship_params)

    respond_to do |format|
      if @tutor_client_relationship.save
        format.html { redirect_to @tutor_client_relationship, notice: "Tutor client relationship was successfully created." }
        format.json { render :show, status: :created, location: @tutor_client_relationship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor_client_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_client_relationships/1 or /tutor_client_relationships/1.json
  def update
    respond_to do |format|
      if @tutor_client_relationship.update(tutor_client_relationship_params)
        format.html { redirect_to @tutor_client_relationship, notice: "Tutor client relationship was successfully updated." }
        format.json { render :show, status: :ok, location: @tutor_client_relationship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor_client_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_client_relationships/1 or /tutor_client_relationships/1.json
  def destroy
    @tutor_client_relationship.destroy
    respond_to do |format|
      format.html { redirect_to tutor_client_relationships_url, notice: "Tutor client relationship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_client_relationship
      @tutor_client_relationship = TutorClientRelationship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_client_relationship_params
      params.require(:tutor_client_relationship).permit(:relID, :tutorID, :clientID, files: [])
    end
end
