class UsersController < ApplicationController

  # renders the home page
  def home
    if current_user.present?
      @name = current_user.username
    else
      @name = "Ironhacker"
    end
  end

  def index
    authorize_user

    @users = User.all
  end

  # renders the signup form
  def new
  end

  def show
    authorize_user
  end

  # receives form and creates a user from that data
  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:username, :email, :password, :password_confirmation)
  end

end
