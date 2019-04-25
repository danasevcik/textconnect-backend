class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user]

  def profile
     render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    # byebug
    @user = User.find(params[:id])
    @amigas = @user.amigas
    render json: @amigas
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def get_user
    token = request.headers["authorization"]
    # byebug
    id = JWT.decode(token, "my_s3cr3t")[0]["user_id"]
    @user = User.find(id)

    if @user.valid?
      render json: { user: {id: @user.id, name: @user.name, age: @user.age, bio: @user.bio, phone_number: @user.phone_number, language: @user.language, photo: @user.photo, username: @user.username}}
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :age, :bio, :phone_number, :language, :photo, :username, :password)
  end

end
