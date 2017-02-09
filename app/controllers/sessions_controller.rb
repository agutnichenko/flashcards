class SessionsController < ApplicationController
  #skip_before_action :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:cards, notice: 'Login successful')
    else
      render action: 'new', notice: 'Login failed'
    end
  end

end
