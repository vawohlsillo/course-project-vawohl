class ProbandosController < ApplicationController
  before_action :set_probando, only: [:show, :edit, :update, :destroy]

  # GET /probandos
  # GET /probandos.json
  def index
    @probandos = Probando.all
  end

  # GET /probandos/1
  # GET /probandos/1.json
  def show
  end

  # GET /probandos/new
  def new
    @probando = Probando.new
  end

  # GET /probandos/1/edit
  def edit
  end

  # POST /probandos
  # POST /probandos.json
  def create
    @probando = Probando.new(probando_params)

    respond_to do |format|
      if @probando.save
        format.html { redirect_to @probando, notice: 'Probando was successfully created.' }
        format.json { render :show, status: :created, location: @probando }
      else
        format.html { render :new }
        format.json { render json: @probando.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /probandos/1
  # PATCH/PUT /probandos/1.json
  def update
    respond_to do |format|
      if @probando.update(probando_params)
        format.html { redirect_to @probando, notice: 'Probando was successfully updated.' }
        format.json { render :show, status: :ok, location: @probando }
      else
        format.html { render :edit }
        format.json { render json: @probando.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probandos/1
  # DELETE /probandos/1.json
  def destroy
    @probando.destroy
    respond_to do |format|
      format.html { redirect_to probandos_url, notice: 'Probando was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probando
      @probando = Probando.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def probando_params
      params.require(:probando).permit(:user_id, :post_id, :parragraph, :number)
    end
end
