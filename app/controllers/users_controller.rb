class UsersController < ApplicationController
  before_action(:authorize_user, :only => [ :show, :index ])

  # renders the home page
  def home
    if current_user.present?
      @name = current_user.username
    else
      @name = "Ironhacker"
    end
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
