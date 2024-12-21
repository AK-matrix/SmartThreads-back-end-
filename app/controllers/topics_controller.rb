class TopicsController < ApplicationController
  def index
    @topics = Topic.all  # Fetch all topics from the database
    render json: @topics  # Render the topics as JSON
  end
end