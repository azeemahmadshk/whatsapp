class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @room = Room.new
    @rooms = Room.all
    #@count = Notification.where.not(seen_by:current_user.id).group(:room_id).count
    #@notifications = Notification.group(:room_id).count
    #@seen_notifications = Notification.includes(:views).where(views:{user_id:current_user.id}).group(:room_id).count

    #@seen_ids = @room.notifications.includes(:views).where(views:{user_id:current_user.id}).pluck(:id).uniq
    #@notify = @notification_ids -@seen_ids
    @count={}
    @all_notifcations = Notification.group(:room_id).count
    @seen_notifications = Notification.includes(:views).where(views: {user_id:current_user.id}).group(:room_id).count
    @seen_notifications.each do |notify|
      @count[notify[0]] = @all_notifcations[notify[0]] - @seen_notifications[notify[0]]
    end
    #@count =  Notification.includes(:views).where.not(views: {user_id:current_user.id}).group(:room_id).count
    if current_user.present?
      @my_rooms = current_user.rooms.all
    end
  end

  # GET /rooms/1 or /rooms/1.json
  def show
   # @notify = @room.notifications.pluck(:id,:seen_by)
   # @notify.each do |notification|
    #  @room.notifications.find(notification[0]).update!(seen_by: notification[1]+","+current_user.id.to_s)
    #end
      @notification_ids = @room.notifications.pluck(:id)
      @seen_ids = @room.notifications.includes(:views).where(views:{user_id:current_user.id}).pluck(:id).uniq
      @notify = @notification_ids -@seen_ids
      @notify.each do |notification|
        View.create(user_id: current_user.id , notification_id: notification , viewed_by: current_user.id)
      end
    $id = params[:id]
    @room_messages = @room.messages.all
      
    @message = Message.new
   if params[:message_id].present?
    @message_display = Message.find_by(id: params[:message_id])
   end
   # format.html {render :show} 

   if request.format.js? 
    render :show, message_display: @message_display
   end  
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end
  def all_members_in_room
    @room = Room.find_by(id: params[:id])
    @room_members = @room.users.all
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @room.save
    respond_to do |format|
      if @room.save
        format.js {render :index}
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    if params[:join].present?
        @room = Room.find_by(id: params[:id]) 
      if @room.user_ids.include? current_user.id
         @message="user is already present" 
      else
        @room.users << current_user
      end
        @room.save
        redirect_to room_url(@room) 
    elsif params[:add_member].present? 
      if params[:add_by_email].to_s.empty?
        @message_display = "user connot be empty"
      end  
        @room = Room.find_by(id: params[:id])
        @user = User.find_by(email: params[:add_by_email])
  
      if @user.present?
        if !@user.email.to_s.empty?
          if @room.user_ids.include? @user.id
            @message_display="user is already present" 
          else
            @room.users << @user
            @message_display ="user added successfully" 
          end
        else
          if @message_display.to_s.empty?
          @message_display = "user connot be added"
          end
        end
      else
         @message_display = "user connot be added"
      end        
        @room.save
        redirect_to room_url(@room, message_display: @message_display)            
    else
      respond_to do |format|
        if @room.update(room_params)
          format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
          format.json { render :show, status: :ok, location: @room }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end
    end 
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :id, :owner_id)
    end
end
