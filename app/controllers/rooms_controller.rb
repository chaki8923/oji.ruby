class RoomsController < ApplicationController

  before_action :set_user, only: [:index, :show]

  def index
  
    rooms = Room.all
    puts 'パラメーター'
    puts params

   if rooms.present?
    puts 'ルームあり'
    rooms_array = rooms.map do |room|
      {
        id: room.id,
        name: room.name,
        user_room:room.user_rooms.map do |user_room|{user_id:user_room.user_id,room_id:user_room.room_id,image:user_room.user.image } end

      }
    end
    
    render json: rooms_array, status: 200
    else
      
      render json: {message:'まだルームはありません'}, status: 400
    end

   

  end

  def show



  end



  def create

    room = Room.new(name: params[:name])



    if room.save
      user_room = UserRoom.create(user_id:params[:user_id],room_id:room.id)
      render json: {id:room.id,name:room.name,message:'登録成功'},status: :ok
    else
      render json: {message:'登録失敗'},status: :miss

    end

    
  end

  def show

    room = @user.rooms.find(params[:id])

  end

  def destroy
  end

  private
  def room_params
    params.require(:rooms).permit(:name)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

 
end
