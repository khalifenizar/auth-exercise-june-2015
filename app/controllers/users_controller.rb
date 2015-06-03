class UsersController < ApplicationController

  before_action :authorize_user, only: [:show]
  before_action :admin_only, only: [:index]

  # renders the home page
  def home
    current_user ? @name = @current_user.username : @name = "Rubyist"
  end

  def index
    @users = User.all
  end

  # renders the signup form
  def new
  end

  def show
  end

  # receives form and creates a user from that data
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end   

  private

  def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end