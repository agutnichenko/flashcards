class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:decks, notice: 'Login successful')
    else
      render action: 'new', notice: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
