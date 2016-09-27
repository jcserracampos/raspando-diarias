class DiariasController < ApplicationController
  before_action :set_diaria, only: [:show, :edit, :update, :destroy]

  # GET /diarias
  # GET /diarias.json
  def index
    @diarias = Diaria.all
  end

  # GET /diarias/1
  # GET /diarias/1.json
  def show
  end

  # GET /diarias/new
  def new
    @diaria = Diaria.new
  end

  # GET /diarias/1/edit
  def edit
  end

  # POST /diarias
  # POST /diarias.json
  def create
    @diaria = Diaria.new(diaria_params)

    respond_to do |format|
      if @diaria.save
        format.html { redirect_to @diaria, notice: 'Diaria was successfully created.' }
        format.json { render :show, status: :created, location: @diaria }
      else
        format.html { render :new }
        format.json { render json: @diaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diarias/1
  # PATCH/PUT /diarias/1.json
  def update
    respond_to do |format|
      if @diaria.update(diaria_params)
        format.html { redirect_to @diaria, notice: 'Diaria was successfully updated.' }
        format.json { render :show, status: :ok, location: @diaria }
      else
        format.html { render :edit }
        format.json { render json: @diaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diarias/1
  # DELETE /diarias/1.json
  def destroy
    @diaria.destroy
    respond_to do |format|
      format.html { redirect_to diarias_url, notice: 'Diaria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diaria
      @diaria = Diaria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diaria_params
      params.require(:diaria).permit(:orgao_superior, :orgao, :unidade_gestora, :favorecido, :valor)
    end
end
