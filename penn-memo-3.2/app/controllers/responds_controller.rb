class RespondsController < ApplicationController
  before_action :set_respond, only: [:show, :edit, :update, :destroy]

  # GET /responds
  # GET /responds.json
  def index
    @responds = Respond.all
  end

  # GET /responds/1
  # GET /responds/1.json
  def show
  end

  # GET /responds/new
  def new
    @respond = Respond.new
  end

  # GET /responds/1/edit
  def edit
  end

  # POST /responds
  # POST /responds.json
  def create
    @respond = Respond.new(respond_params)

    respond_to do |format|
      if @respond.save
        format.html { redirect_to @respond, notice: 'Respond was successfully created.' }
        format.json { render :show, status: :created, location: @respond }
      else
        format.html { render :new }
        format.json { render json: @respond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responds/1
  # PATCH/PUT /responds/1.json
  def update
    respond_to do |format|
      if @respond.update(respond_params)
        format.html { redirect_to @respond, notice: 'Respond was successfully updated.' }
        format.json { render :show, status: :ok, location: @respond }
      else
        format.html { render :edit }
        format.json { render json: @respond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responds/1
  # DELETE /responds/1.json
  def destroy
    @respond.destroy
    respond_to do |format|
      format.html { redirect_to responds_url, notice: 'Respond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respond
      @respond = Respond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respond_params
      params.require(:respond).permit(:user_id, :memo_id, :respond_content)
    end
end
