class GruposController < ApplicationController

  before_action :set_grupo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /grupos
  # GET /grupos.json


  def index
        if params[:search]
            @grupos = Grupo.where(user_id: current_user).search(params[:search]).order("created_at DESC")
        else
            @grupos = Grupo.where(user_id: current_user).order('created_at DESC')
        end
    end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
  end

  # GET /grupos/new
  #def new
  #  @grupo = grupo.new
  #  @grupo.room_categories.build
  #end

  def new
        @grupo = current_user.grupos.build
    end

 # GET /grupos/1/edit
  def edit
    #@grupo.room_categories.build
  end

  # POST /grupos
  # POST /grupos.json
  #def create
  #  @grupo = grupo.new(grupo_params)

  #  respond_to do |format|
   #   if @hotel.save
   #     format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
   #     format.json { render :show, status: :created, location: @hotel }
   #   else
    #    format.html { render :new }
    #    format.json { render json: @hotel.errors, status: :unprocessable_entity }
    #  end
   # end
 # end

def create
      @grupo = current_user.grupos.build(grupo_params)

      respond_to do |format|
          if @grupo.save
            format.html { redirect_to @grupo, notice: 'grupo was successfully created.' }
            format.json { render :show, status: :created, location: @grupo }
          else
            format.html { render :new }
            format.json { render json: @grupo.errors, status: :unprocessable_entity }
          end
      end
end


  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to @grupo, notice: 'grupo was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo.destroy
    respond_to do |format|
      format.html { redirect_to grupos_url, notice: 'grupo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   def grupo_params
     params.require(:grupo).permit(:nome, grupo_emails_attributes: [ :id, :nome, :email, :tipo, :_destroy,  ])
   end

end
