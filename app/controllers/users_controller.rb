class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  #新規登録
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end


  #マイページを表示させる
  def show
  	@user = User.find(params[:id])
  end


  def create
   @user = User.new(user_params) 
    if @user.save
      log_in @user
   	 flash[:success] = "Welcome to REAL!"
     redirect_to @user
   else
      render 'new'
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

   private

     def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
     end

     # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
