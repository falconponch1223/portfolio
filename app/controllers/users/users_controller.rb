class Users::UsersController < Users::Base
  def show
    @user = User.find(params[:id])
  end
end
