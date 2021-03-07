class ChoicesController < ApplicationController
  def new
    @choice = Choice.new
    @survey = Survey.find(params[:survey_id])
    @choice.survey = @survey
    authorize @choice
  end

  def create

  end
end
