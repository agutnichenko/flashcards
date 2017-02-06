class Authentication < ApplicationRecord
  belongs_to :user

  def auth_params
      params.permit(:user_id, :provider, :uid)
    end

end
