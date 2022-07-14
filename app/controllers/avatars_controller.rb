class AvatarsController < ApplicationController

  def new

    @avatar = Avatar.new
  end

  def create

    @avatar = Avatar.new(avatar_params)
  

    puts "アバター"
    puts avatar_params[:image]

    if @avatar.save

      puts 'イメージ情報'
      @avatar.image
      render json: {id: @avatar.id,user_id: @avatar.user_id,image: @avatar.image},status: 200
    else
      render json: {message:'失敗しました',error: @avatar.errors.messages},status: 400
    end
  end

  private
  def avatar_params
    params.permit(:image, :user_id)
  end
 
end
