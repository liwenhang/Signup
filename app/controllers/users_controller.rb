class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	   if @user.save
            log_in @user
            #format.html { redirect_to @user, notice: '欢迎来到德莱联盟！' }
            #format.json { render :show, status: :created, location: @user }
            flash[:success] = "欢迎来到德莱联盟！"
            redirect_to @user
  	   else
  	        render 'new'
  	   end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = @user.id
      redirect_to @user 
    else
      render 'edit' 
    end
  end


  private

  def user_params
  	params.require(:user).permit(:name, :email, :password,
  									             :password_confirmation,:cover)
  end
end
