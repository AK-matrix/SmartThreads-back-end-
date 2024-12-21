# app/controllers/protected_controller.rb
class ProtectedController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: { message: 'This is a protected route', user: @current_user }, status: :ok
  end
end
