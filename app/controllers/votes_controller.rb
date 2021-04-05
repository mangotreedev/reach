class VotesController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    choice = Choice.find(params[:choice_id])
    vote = Vote.create(choice: choice, cookie: @cookie)
    authorize vote
    redirect_to survey_results_path(choice.survey)
  end
end
