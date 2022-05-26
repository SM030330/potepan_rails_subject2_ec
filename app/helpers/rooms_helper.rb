module RoomsHelper
  def count_rooms
    if @rooms.nil?
      return 0
    else
      return @rooms.size
    end
  end
end
