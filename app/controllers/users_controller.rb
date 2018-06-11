class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
def show
end
def edit
end
def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      session[:name] = @user.name
      session[:user_id] = @user.id
      format.html { redirect_to @user, notice: 'User was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
    else
      format.html { render :edit }
    end
  end
end

def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to frogs_url, notice: 'User was successfully destroyed.' }
  end
end


private

def user_params
  params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :password_confirmation)
end
def set_user
  @user = User.find(params[:id])
end

end
