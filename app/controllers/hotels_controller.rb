class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /hotels
  # GET /hotels.json

 before_filter :process_shares_attrs, only: [:create, :update]

  def process_shares_attrs
    params[:hotel][:shares_attributes].values.each do |cat_attr|
      cat_attr[:_destroy] = true if cat_attr[:enable] != '1'
    end
  end


  def index

        if params[:search]
            @hotels = Hotel.where(user_id: current_user).search(params[:search]).order("created_at DESC")
        else
            @hotels = Hotel.where(user_id: current_user).order('created_at DESC')
        end

        @hotels_shares = Hotel.find_by_sql(["
        select * from hotels where id in (
            select hotel_id from shares where grupo_id in(
                  select grupo_id from contatos_grupos where contato_id in (
                        select id from contatos where email = :email
                  )
             )
        )",{:email => current_user.email}])

       #Hotel.find(16).grupos.first.contatos.where(email: "teste@teste.com")

        #Hotel.all.each do |h|
         #  @hotels_shares = h
        #end

  end


#Hotel.select("*").joins(:user).where(:users => {:u_id => @user_session.id})




  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  #def new
  #  @hotel = Hotel.new
  #  @hotel.room_categories.build
  #end

  def new
        @hotel = current_user.hotels.build
    end

 # GET /hotels/1/edit
  def edit
    #@hotel.room_categories.build
  end

  # POST /hotels
  # POST /hotels.json
  #def create
  #  @hotel = Hotel.new(hotel_params)

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
      @hotel = current_user.hotels.build(hotel_params)

      respond_to do |format|
          if @hotel.save
            format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
            format.json { render :show, status: :created, location: @hotel }
          else
            format.html { render :new }
            format.json { render json: @hotel.errors, status: :unprocessable_entity }
          end
      end
end


  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   def hotel_params
     params.require(:hotel).permit(
                  :name, :image,
                  room_categories_attributes: [ :id, :name, :arquivo, :_destroy,  ],
                  shares_attributes: [ :id, :grupo_id, :hotel_id, :tipo, :enable, :_destroy,  ]
                  )
   end
end
