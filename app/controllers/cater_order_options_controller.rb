class CaterOrderOptionsController < ApplicationController
before_action :set_cater_order_option, only: [:show, :edit, :update, :destroy]
before_action :logged_in_user, only: [:index]
before_action :admin_user,     only: [:show, :edit, :create, :update, :destroy]


  # GET /cater_order_options
  # GET /cater_order_options.json
  def index
    @cater_order_options = CaterOrderOption.all
  end

  # GET /cater_order_options/1
  # GET /cater_order_options/1.json
  def show
  end

  # GET /cater_order_options/new
  def new
    @cater_order_option = CaterOrderOption.new
  end

  # GET /cater_order_options/1/edit
  def edit
  end

  # POST /cater_order_options
  # POST /cater_order_options.json
  def create
    @cater_order_option = CaterOrderOption.new(cater_order_option_params)

    respond_to do |format|
      if @cater_order_option.save
        format.html { redirect_to @cater_order_option, notice: 'Cater order option was successfully created.' }
        format.json { render :show, status: :created, location: @cater_order_option }
      else
        format.html { render :new }
        format.json { render json: @cater_order_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cater_order_options/1
  # PATCH/PUT /cater_order_options/1.json
  def update
    respond_to do |format|
      if @cater_order_option.update(cater_order_option_params)
        format.html { redirect_to @cater_order_option, 
        notice: 'Cater order option was successfully updated.' }
        format.json { render :show, status: :ok, location: @cater_order_option }
        
        
  #Another reason errors are occuring
      #  @cater_order_option = CaterOrderOption.all
     #   ActionCable.server.broadcast 'catering_items',
    #    html: render_to_string('catering_items/CateringMenu', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @cater_order_option.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /cater_order_options/1
  # DELETE /cater_order_options/1.json
  def destroy
    @cater_order_option.destroy
    respond_to do |format|
      format.html { redirect_to cater_order_options_url, notice: 'Cater order option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cater_order_option
      @cater_order_option = CaterOrderOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cater_order_option_params
      params.require(:cater_order_option).permit(:cateringOptions, :CaterDesc, :sideOptions, :sideDesc, :price)
    end
    
    def user_params
        params.require(:user).permit(:FullName, :email, :password,
                                   :PhoneNumber)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
        
      end
    end
        # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
        # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
