class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def show; end

  def edit 
    # format.respond_to do |format|
    #   format.js
    # end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :designation, :about)
  end
end
