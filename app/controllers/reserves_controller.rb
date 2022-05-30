class ReservesController < ApplicationController

  def index_reserved
    @reserves = Reserve.where(user_id: current_user.id)
  end

  def new
    @room = Room.find_by_id(params[:room_id])
    @reserve = current_user.reserves.new
  end

  def new_confirmation
    @room = Room.find_by_id(params[:reserve][:room_id])
    @reserve = current_user.reserves.new(reserve_params)
    render :new, status: :unprocessable_entity unless @reserve.valid?
  end

  def create
    @reserve = current_user.reserves.new(reserve_params)
    if @reserve.save
      flash[:success] = "登録に成功しました。"
      redirect_to root_url
    else
      @room = Room.find_by_id(params[:reserve][:room_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reserve_params
    params.require(:reserve).permit(:startdate, :finishdate, :member_sum, :room_id)
  end
end
