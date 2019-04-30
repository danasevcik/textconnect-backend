class Api::V1::FriendshipsController < ApplicationController

  def create
    # byebug
    @user = User.find(params[:user][:user_id])
    @amiga = User.find(params[:user][:amiga_id])
    @friendship = Friendship.find_or_create_by(user_id: @user.id, amiga_id: @amiga.id)

    render json: {amiga: @amiga, friendship: @friendship}
  end

  def remove
    # byebug
    @user = User.find(params[:user][:user_id])
    @amiga = User.find(params[:user][:amiga_id])
    @friendship = Friendship.find_by(user_id: @user.id, amiga_id: @amiga.id)
    @friendship.destroy

    render json: {amiga: @amiga, friendship: @friendship}
  end

end
