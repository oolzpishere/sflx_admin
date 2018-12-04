class CrequestsController < ApplicationController
  before_action :set_crequest, only: [:show, :edit, :update, :destroy]

  # GET /crequests
  # GET /crequests.json
  def index
    @crequests = Crequest.all
  end

  # GET /crequests/1
  # GET /crequests/1.json
  def show
  end

  # GET /crequests/new
  def new
    @crequest = Crequest.new
  end

  # GET /crequests/1/edit
  def edit
  end

  # POST /crequests
  # POST /crequests.json
  def create
    @crequest = Crequest.new(crequest_params)

    respond_to do |format|
      if @crequest.save
        format.html { redirect_to '/contact', notice: '项目需求提交成功。' }
        # format.html { redirect_to @crequest, notice: 'Crequest was successfully created.' }
        format.json { render :show, status: :created, location: @crequest }
        MailWorker.perform_async(@crequest.attributes)

      else
        format.html { render :new }
        format.json { render json: @crequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crequests/1
  # PATCH/PUT /crequests/1.json
  def update
    respond_to do |format|
      if @crequest.update(crequest_params)
        format.html { redirect_to @crequest, notice: 'Crequest was successfully updated.' }
        format.json { render :show, status: :ok, location: @crequest }
      else
        format.html { render :edit }
        format.json { render json: @crequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crequests/1
  # DELETE /crequests/1.json
  def destroy
    @crequest.destroy
    respond_to do |format|
      format.html { redirect_to crequests_url, notice: 'Crequest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crequest
      @crequest = Crequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crequest_params
      params.fetch(:crequest, {}).permit(:name, :phone, :request)
    end
end
