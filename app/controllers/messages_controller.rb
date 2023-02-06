class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
   @messages = Message.all
   @room = Room.find_by(id: params[:room_id])
   @user= current_user
    if params[:search_by_messages] && params[:search_by_messages] != ""
      @search_messages = Message.search_messages(@room.id, params[:search_by_messages])
    end
    if @search_messages == nil
      @notice = "message not found"
    end    
 # end
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @my_room = params[:room]
    @user = params[:user]
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @room = message_params[:room_id]
    @message.save
    if message_params[:images].present?
      @message.images = message_params[:images]
    end
    respond_to do |format|
      if @message.save 
       #format.html { redirect_to room_url(@room), notice: "Message was successfully created." }
       #format.json { render :show, status: :created, location: @message }
       
       SendMessageJob.perform_later(@message.id)
       format.js{}
      # format.js {redirect_to "/rooms/#{@room}?format=js&message_id=#{@message.id}" , notice: "Message was successfully created.",message: @message }
      else
       # format.html { redirect_to room_url(@room) , notice: "Message not created" }
        #format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def search_messages
    @room = Room.find_by(id: params[:room_id])
    if params[:search_by_messages] && params[:search_by_messages] != ""
      @search_messages = Message.new.search_messages(@room.id, params[:search_by_messages])
    end

    if @search_messages == nil
      @notice = "message not found"
    end  
  end


  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @room = Room.find_by(id: params[:room_id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to room_url(@room), notice: "Message was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:description,:attachment, :room_id , :user_id, images: [])
    end
end
