class LikesController < ApplicationController

  # before_action :authenticate_user!, only: [:create]

  def create
    like = Like.new(message_id: params[:message_id],user_id: current_user.id)

    if like.save
      render json: {id: like.id,email: current_user.email,message:'いいね成功',message_id: like.message_id},status: :ok
    else
      
      render json: {message:'失敗しました',error: like.errors.message},status: :miss
    end

  end
  def destroy
    like = Like.find(params[:id])

    if like.destroy
      render json: {id: like.id,email: current_user.email,message:'削除成功'},status: :ok
    else
      
      render json: {message:'失敗しました',error: like.errors.message},status: :miss
    end

  end
end
