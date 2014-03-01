class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  # GET /assessments
  # GET /assessments.json
  def index
    @assessments = Assessment.all.where('student_id=?',params[:student_id])
    @student_id = params[:student_id]
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @assessment = Assessment.new
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)
    
    respond_to do |format|
      @assessment.student = Student.find_by_id(params[:student_id])
      if @assessment.save
        format.html { redirect_to  student_assessments_url(params[:student_id]), notice: 'Assessment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assessment }
      else
        format.html { render action: 'new', :params => { :student_id => @assessment.student.id} }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to student_assessments_url(params[:student_id]), notice: 'Assessment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' ,  :params => { :student_id => @assessment.student_id }}
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to student_assessments_url(params[:student_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
      @student_id = params[:student_id].blank? ? @assessment.student_id : params[:student_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params.require(:assessment).permit(:FA1,:FA2,:SA1)
    end
end
