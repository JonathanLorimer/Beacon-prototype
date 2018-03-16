class UsersController < ApplicationController

  def index
    @users = User.all
    render json: {data: @users}
  end



  def new
  end


  def show

    @user = User.find(params[:id])
    render json: {data: @user}
    
  end



  def create
    puts "it is from users"
    puts "#{params}"
    # @user = User.new(user_params)

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end

  end


end