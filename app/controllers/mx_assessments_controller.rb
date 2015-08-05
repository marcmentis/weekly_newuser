class MxAssessmentsController < ApplicationController
  before_action :set_mx_assessment, only: [:show, :edit, :update, :destroy]

  #GET /mxa_date_history/.json
  def date_history
    # byebug
    @date_history = MxAssessment.select(:meeting_date).distinct.joins(:patient)
                                .where(patients: {facility: session[:facility]})
                                .where(patients: {site: params[:site]})
                                .order(meeting_date: :desc)

    respond_to do |format|
      format.json {render json: @date_history}
    end
  end

  #GET mxa_pat_lists.json
  def patient_lists
    # byebug
    facility = session[:facility]
    @all_lists = MxAssessment.get_pat_lists(mx_assessment_params, facility)

    respond_to do |format|
      format.json {render json: @all_lists}
    end
  end

  #GET mxa_pat_data.json
  def get_pat_data

    pat_demog = Patient.find(params[:mx_assessment]['id']);
    # @pat_data = {pat_demog: pat_demog}
    # Convert relation (array) to object
    pat_demog = pat_demog.first;
    doa = pat_demog.doa.strftime('%D');

    @pat_data = {pat_demog: pat_demog, doa: doa}
    respond_to do |format|
      format.json {render json: @pat_data}
    end
  end

  # GET /mx_assessments
  # GET /mx_assessments.json
  def index
    @mx_assessments = MxAssessment.all
  end

  # GET /mx_assessments/1
  # GET /mx_assessments/1.json
  def show
  end

  # GET /mx_assessments/new
  def new
    @mx_assessment = MxAssessment.new
  end

  # GET /mx_assessments/1/edit
  def edit
  end

  # POST /mx_assessments
  # POST /mx_assessments.json
  def create
    @mx_assessment = MxAssessment.new(mx_assessment_params)

    respond_to do |format|
      if @mx_assessment.save
        # format.html { redirect_to @mx_assessment, notice: 'Mx assessment was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @mx_assessment }
        format.json {head :no_content}
      else
        # format.html { render action: 'new' }
        format.json { render json: @mx_assessment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mx_assessments/1
  # PATCH/PUT /mx_assessments/1.json
  def update
    respond_to do |format|
      if @mx_assessment.update(mx_assessment_params)
        format.html { redirect_to @mx_assessment, notice: 'Mx assessment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mx_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mx_assessments/1
  # DELETE /mx_assessments/1.json
  def destroy
    @mx_assessment.destroy
    respond_to do |format|
      format.html { redirect_to mx_assessments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mx_assessment
      @mx_assessment = MxAssessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mx_assessment_params
      # params[:mx_assessment]
      params.require(:mx_assessment).permit(:danger_yn, :drugs_last_changed, 
                                            :drugs_not_why, :drugs_change_why, :psychsoc_last_changed,
                                            :psychsoc_not_why, :psychsoc_change_why, :meeting_date, 
                                            :patient_id, :pre_date_yesno,
                                            :pre_date_no_why, :pre_date, :updated_by,
                                            :site, :new_date, :date_history)
    end
end
