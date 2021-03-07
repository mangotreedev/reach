class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    authorize @survey
  end

  def create

  end
end
