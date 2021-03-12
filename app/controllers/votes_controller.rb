class VotesController < ApplicationController
  def create
    choice = Choice.find(params[:choice_id])
    vote = Vote.create(choice: choice)
    authorize vote
    redirect_to survey_results_path(choice.survey)
  end
end
