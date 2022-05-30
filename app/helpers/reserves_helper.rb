module ReservesHelper
  
  def room_owner(user_id)
    User.find_by_id(user_id)
  end
end
