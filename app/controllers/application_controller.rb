class ApplicationController < ActionController::API
  def authenticate_request!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) if decoded
  rescue
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
