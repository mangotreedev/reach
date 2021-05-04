class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [ ]

  def home
    @survey = RandomSurveySelector.call(@cookie)
  end

  def about
    @sample_survey = Survey.first
  end

  def kitchensink; end
end
