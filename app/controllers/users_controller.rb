class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    if params[:room_id].present?
      @room = Room.find_by(id: params[:room_id])
      @room_members = @room.users.all
    end
     #render js: "alert('The username to be displayed is: #{params[:name]}')"
   # render js: "alert('The username to be displayed is: #{params[:email]}')"
  end

  # GET /users/1 or /users/1.json
  def show
    @room = Room.all
    @my_rooms =User.find_by(id: params[:id]).rooms.all
  end
  def add_user_to_room
    @room = Room.find_by(name: params[:room_name]) 
    @user =  User.find_by(id: params[:user_id])
    if @room.user_ids.include? @user.id
       @message="user is already present" 
    else
      @room.users << @user
    end
    #@room.users.create(@user
    #@room.users.create(name: @user.name, number: @user.number)
    @room.save
    redirect_to user_path(@user)         
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :number, :avatar)
    end
end
