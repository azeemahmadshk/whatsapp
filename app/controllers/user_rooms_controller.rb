class UserRoomsController < ApplicationController
  before_action :set_user_room, only: %i[ show edit update destroy ]

  # GET /user_rooms or /user_rooms.json
  def index
    @user_rooms = UserRoom.all
  end

  # GET /user_rooms/1 or /user_rooms/1.json
  def show
  end

  # GET /user_rooms/new
  def new
    @user_room = UserRoom.new
  end

  # GET /user_rooms/1/edit
  def edit
  end

  # POST /user_rooms or /user_rooms.json
  def create
    @user_room = UserRoom.new(user_room_params)
    respond_to do |format|
      if @user_room.save
        format.html { redirect_to user_room_url(@user_room), notice: "User room was successfully created." }
        format.json { render :show, status: :created, location: @user_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_rooms/1 or /user_rooms/1.json
  def update
    respond_to do |format|
      if @user_room.update(user_room_params)
        format.html { redirect_to user_room_url(@user_room), notice: "User room was successfully updated." }
        format.json { render :show, status: :ok, location: @user_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_rooms/1 or /user_rooms/1.json
  def destroy
    @user_room.destroy
    respond_to do |format|
      format.html { redirect_to user_rooms_url, notice: "User room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_room
      @user_room = UserRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_room_params
      params.require(:user_room).permit(:user, :room)
    end
end
