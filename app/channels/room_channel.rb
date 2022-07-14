class RoomChannel < ApplicationCable::Channel
  def subscribed
    puts 'パラメーター'
    puts params
    vue側で制御してrejectしなくてもよくすう
    @user = User.find_by(id: params[:user_id])
    reject if @user.nil?
    @room = @user.rooms.find_by(id: params[:room_id])
    # reject if @room.nil?
    puts 'ルーム'
    puts @room
    # stream_for(@room)  
    stream_from "room_channel-#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    puts 'リクエスト受信'
    user = User.find_by(email: data['email'])


    if message = Message.create(content: data['message'], user_id: user.id,  room_id: data['room_id'],requestFlg:data['requestFlg'])
      puts 'save成功'
      puts "room_channel-#{user.id}-#{data['room_id']}"
      ActionCable.server.broadcast "room_channel-#{data['room_id']}",{message: data['message'],name:user.name,created_at:message.created_at}
    end
  end
end
