class RoomsController < ApplicationController
  before_action :load_entities

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    @room.user << current_user
    add_users

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end

  def edit; end

  def update
    if @room.update(permitted_parameters)
      add_users
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def add_users
    # puts @room.user.inspect
    @room_users['users']&.each do |user_id|
      @room.user << User.all.find { |user| user.id == user_id.to_i }
    end
  end

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    @room_users = params.permit(users: []).to_h
    params.require(:room).permit(:name)
  end
end
