class SessionsController < ApplicationController

  def new
    Session.create(user_params)
  end

  def create


    user = User.find_by_email(params[:email])

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      render json: {data: user}

    else
    # If user's login doesn't work, send them back to the login form.
      render json: {data: 'failed'}

    end
  end

  def destroy
    session[:user_id] = nil

  end
  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
