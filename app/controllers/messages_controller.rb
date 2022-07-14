class MessagesController < ApplicationController

  # before_action :authenticate_user!, only: [:index]
  before_action :set_room, only: [:index, :show]
  def index
    puts 'ユーザー'
    puts @room.name
    messages = @room.messages

  if messages.present?
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user_id,
        room_id: message.room_id,
        email: message.email,
        content: message.content,
        created_at: message.created_at,
        requestFlg:message.requestFlg,
        likes:message.likes.map do |like| {id: like.id,email: like.user.email} end

      }
    end
    render json: messages_array, status: 200
  else
    render json: {message:'まだメッセージはありません'}, status: 400
  end

  end

  def destroy
    message = Message.find(params[:id])

    if message.destroy
      render json: {id: message.id,content: message.content,message: 'メッセージを削除しました'},status: :ok
    else
      render json: {message: '削除失敗'},status: :miss
    end
    
  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end
end
