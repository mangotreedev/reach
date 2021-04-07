class User::DashboardsController < ApplicationController
  def show
    authorize :show?, policy_class: User::DashboardPolicy
    @user_surveys = Survey.where(user: current_user)
  end
end
