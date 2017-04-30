class Home::SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:decks, notice: t(:login_successful))
    else
      render action: 'new', notice: t(:login_failed)
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
