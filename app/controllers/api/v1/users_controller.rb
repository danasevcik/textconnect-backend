class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user]

  def profile
    # get user's attributes
     render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    # sort contacts alphabetically by username
    @user = User.find(params[:id])
    @amigas = @user.amigas
    @amigas = @amigas.sort_by{|amiga| amiga[:username]}
    @conversations = @user.conversations
    render json: {amigas: @amigas, conversations: @conversations}
  end

  def non_amigas
    # sort "non amigas" alphabetically by username
    @user = User.find(params[:user][:user_id])
    @amigas = @user.amigas
    @users = User.all
    @non_amigas = @users - @amigas - [@user]
    @non_amigas = @non_amigas.sort_by{|non_amiga| non_amiga[:username]}
    render json: {non_amigas: @non_amigas}
  end

  def create
    # create user with username and password
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def get_user
    # retrieve user on refresh
    token = request.headers["authorization"]
    id = JWT.decode(token, ENV['SECRET_KEY'])[0]["user_id"]
    @user = User.find(id)

    if @user.valid?
      render json: { user: {id: @user.id, name: @user.name, age: @user.age, bio: @user.bio, phone_number: @user.phone_number, language: @user.language, photo: @user.photo, username: @user.username}}
    else
      render json: { error: 'failed to find user' }, status: :not_acceptable
    end
  end

  def update
    # allow users to edit profile
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end


  private

  def user_params
    params.require(:user).permit(:name, :age, :bio, :phone_number, :language, :photo, :username, :password)
  end

end
