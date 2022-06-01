class RoomsController < ApplicationController

  def index
    # @rooms = find_rooms(params[:rooms_find_key])
    params.each do |key, value|
      if key == "areaword"
        @rooms = Room.find_rooms_area(value)
      elsif key == "anyword"
        @rooms = Room.find_rooms_any(value)
      end
    end
  end

  def index_created
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(params_room)
    @room.room_img.attach(params[:room][:room_img])   
    if @room.save 
      flash[:success] = "新しいルームの作成に成功しました"
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  def params_room
    params.require(:room).permit(:name, :info, :value, :address)
  end

end
