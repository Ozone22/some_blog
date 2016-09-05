class Admin::UsersController < Admin::AdminBaseController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user), notice: 'Пользователь изменен'
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to admin_root_path, notice: 'Пользователь успешно удален'
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end

end

