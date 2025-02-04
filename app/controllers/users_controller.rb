class UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password]) # `authenticate` checks the password
      # Use credentials for the secret key base
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
