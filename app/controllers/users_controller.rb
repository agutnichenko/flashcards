class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = current_user
  end

  # GET /users/1/edit
  def edit; end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.update(user_params)
      redirect_to user_path,
                  notice: 'User was successfully updated'
    else
      redirect_to edit_user_path
    end
  end

  private

  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password_confirmation, :password, :current_deck_id)
  end
end
