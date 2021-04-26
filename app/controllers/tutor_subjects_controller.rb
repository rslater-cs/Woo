class TutorSubjectsController < ApplicationController
  before_action :set_tutor_subject, only: %i[ show edit update destroy ]

  # GET /tutor_subjects or /tutor_subjects.json
  def index
    @tutor_subjects = TutorSubject.all
  end

  # GET /tutor_subjects/1 or /tutor_subjects/1.json
  def show
  end

  # GET /tutor_subjects/new
  def new
    @tutor_subject = TutorSubject.new
  end

  # GET /tutor_subjects/1/edit
  def edit
  end

  # POST /tutor_subjects or /tutor_subjects.json
  def create
    @tutor_subject = TutorSubject.new(tutor_subject_params)

    respond_to do |format|
      if @tutor_subject.save
        format.html { redirect_to @tutor_subject, notice: "Tutor subject was successfully created." }
        format.json { render :show, status: :created, location: @tutor_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_subjects/1 or /tutor_subjects/1.json
  def update
    respond_to do |format|
      if @tutor_subject.update(tutor_subject_params)
        format.html { redirect_to @tutor_subject, notice: "Tutor subject was successfully updated." }
        format.json { render :show, status: :ok, location: @tutor_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_subjects/1 or /tutor_subjects/1.json
  def destroy
    @tutor_subject.destroy
    respond_to do |format|
      format.html { redirect_to tutor_subjects_url, notice: "Tutor subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_subject
      @tutor_subject = TutorSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_subject_params
      params.require(:tutor_subject).permit(:subjectID, :tutorID, :subject)
    end
end
