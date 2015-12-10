class GrupoEmailController < ApplicationController

   before_action :set_grupo_email, only: [:show, :edit, :update, :destroy]

  # GET /room_categories
  # GET /room_categories.json
  def index
    @grupo_email = GrupoEmail.all
  end

  # GET /room_categories/1
  # GET /room_categories/1.json
  def show
  end

  # GET /room_categories/new
  def new
    @grupo_email = GrupoEmail.new
  end

  # GET /room_categories/1/edit
  def edit
  end

  # POST /room_categories
  # POST /room_categories.json
  def create
    @grupo_email = GrupoEmail.new(grupo_email_params)

    respond_to do |format|
      if @grupo_email.save
        format.html { redirect_to @grupo_email, notice: 'grupo_email was successfully created.' }
        format.json { render :show, status: :created, location: @grupo_email }
      else
        format.html { render :new }
        format.json { render json: @grupo_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_categories/1
  # PATCH/PUT /room_categories/1.json
  def update
    respond_to do |format|
      if @grupo_email.update(grupo_email_params)
        format.html { redirect_to @grupo_email, notice: 'grupo_email category was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupo_email }
      else
        format.html { render :edit }
        format.json { render json: @grupo_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_categories/1
  # DELETE /room_categories/1.json
  def destroy
    @grupo_email.destroy
    respond_to do |format|
      format.html { redirect_to grupo_email_url, notice: 'grupo_email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_email
      @grupo_email = GrupoEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_email_params
      params.require(:grupo_emails).permit(:grupo_id,  :email)
    end

end
