class Admin::UsersController < ApplicationController
  # check to make sure user is admin
  before_filter :authenticate_admin!
  before_action :find_user_params, only: [:show, :destroy]

  def index
    @users=User.all
  end

  def new
  end

  def show
  end

  def create
    @user=User.new(artist_params)
    raw_password = SecureRandom.hex
    @user.password= raw_password
    @user.artist= true

    if @user.save
      #ArtistMailer.sign_up_artist(@user).deliver_now
      # TODO: Email them their password, which is captured in raw_password.
      # Success flash message
      redirect_to admin_users_path, notice: 'Artist successfully created!'
    else
      # Error flash message
      render 'new'
    end
  end


  def destroy
    # Getting a bad guy off our back.
    @user.destroy
    redirect_to admin_users_path
  end


  private

    # def make_sure_user_is_admin
      
    # end

    def find_user_params
      @user= User.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:email, :username, :password)
    end
end
