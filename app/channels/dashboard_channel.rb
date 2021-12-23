class DashboardChannel < ApplicationCable::Channel
  def subscribed
    current_user = User.find(params[:id])
    stream_for current_user
  end
end
