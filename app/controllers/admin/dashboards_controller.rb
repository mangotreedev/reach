class Admin::DashboardsController < ApplicationController
  def show
    authorize :show?, policy_class: Admin::DashboardPolicy
    @reported_surveys = Survey.where(approved: false)
  end
end
