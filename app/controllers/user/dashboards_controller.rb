class User::DashboardsController < ApplicationController
  def show
    authorize :dashboard, :show?
    @user_surveys = Survey.where(user: current_user)
  end
end
