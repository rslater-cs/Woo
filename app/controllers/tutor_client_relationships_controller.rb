class TutorClientRelationshipsController < ApplicationController
  before_action :check_user, :set_tutor_client_relationship, only: %i[ show edit update destroy ]

  def check_user

    rel = TutorClientRelationship.find(params[:id])

    if current_user.role == 'tutor'
      if current_user.id == rel.clientID || current_user.id == rel.tutorID
        puts('allowed connection')
      elsif Family.where(parentID: current_user.id, childID: rel.clientID).present?
        puts('allowed connection')
      else
        flash.alert = "Not allowed!"
        redirect_to root_path
      end

    elsif current_user.role == 'adult'
      if current_user.id == rel.clientID
        puts('allowed connection')
      elsif Family.where(parentID: current_user.id, childID: rel.clientID).present?
        puts('allowed connection')
      else
        flash.alert = "Not allowed!"
        redirect_to root_path
      end

    elsif current_user.role == 'child'
      if current_user.id == rel.clientID
        puts('allowed connection')
      else
        flash.alert = "Not allowed!"
        redirect_to root_path
      end
    end
  end

  # GET /tutor_client_relationships or /tutor_client_relationships.json
  def index
    @tutor_client_relationships = TutorClientRelationship.all
  end

  # GET /tutor_client_relationships/1 or /tutor_client_relationships/1.json
  def show
    # require 'uri'
    # require 'net/http'
    # require 'openssl'

    # url = URI("https://api.daily.co/v1/")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    # request = Net::HTTP::Get.new(url)
    # request["Authorization"] = 'Bearer a911ee28582995cc96b554b317c020b44dff7d2ca0a39fce7cad9bad25912760'

    # response = http.request(request)

    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://api.daily.co/v1/rooms")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'Bearer a911ee28582995cc96b554b317c020b44dff7d2ca0a39fce7cad9bad25912760'
    request.body = "{\"properties\":{\"enable_network_ui\":false,\"enable_chat\":true},\"name\":\"chris\"}"

    response = http.request(request)
    puts response.read_body

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
