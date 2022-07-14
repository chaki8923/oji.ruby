class UserRoomsController < ApplicationController

  def create
    puts 'userroom生成'
    if user_room = UserRoom.create(user_id: params[:user_id],room_id: params['room_id'])
      puts 'userroom生成成功'
      render json: {user_id: user_room.user_id,room_id: user_room.room_id,message: 'リクエスト成功'},status: 200
    else
      render json: {message: 'リクエスト失敗'},status: 400
    end
  end
end
