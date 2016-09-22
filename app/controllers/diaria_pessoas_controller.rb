class DiariaPessoasController < ApplicationController
  before_action :set_diaria_pessoa, only: [:show, :edit, :update, :destroy]

  # GET /diaria_pessoas
  # GET /diaria_pessoas.json
  def index
    @diaria_pessoas = DiariaPessoa.all
  end

  # GET /diaria_pessoas/1
  # GET /diaria_pessoas/1.json
  def show
  end

  # GET /diaria_pessoas/new
  def new
    @diaria_pessoa = DiariaPessoa.new
  end

  # GET /diaria_pessoas/1/edit
  def edit
  end

  # POST /diaria_pessoas
  # POST /diaria_pessoas.json
  def create
    @diaria_pessoa = DiariaPessoa.new(diaria_pessoa_params)

    respond_to do |format|
      if @diaria_pessoa.save
        format.html { redirect_to @diaria_pessoa, notice: 'Diaria pessoa was successfully created.' }
        format.json { render :show, status: :created, location: @diaria_pessoa }
      else
        format.html { render :new }
        format.json { render json: @diaria_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaria_pessoas/1
  # PATCH/PUT /diaria_pessoas/1.json
  def update
    respond_to do |format|
      if @diaria_pessoa.update(diaria_pessoa_params)
        format.html { redirect_to @diaria_pessoa, notice: 'Diaria pessoa was successfully updated.' }
        format.json { render :show, status: :ok, location: @diaria_pessoa }
      else
        format.html { render :edit }
        format.json { render json: @diaria_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaria_pessoas/1
  # DELETE /diaria_pessoas/1.json
  def destroy
    @diaria_pessoa.destroy
    respond_to do |format|
      format.html { redirect_to diaria_pessoas_url, notice: 'Diaria pessoa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diaria_pessoa
      @diaria_pessoa = DiariaPessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diaria_pessoa_params
      params.require(:diaria_pessoa).permit(:orgao_superior, :orgao, :unidade_gestora, :favorecido, :valor)
    end
end
