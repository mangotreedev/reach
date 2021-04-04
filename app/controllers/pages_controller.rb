class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [ ]

  def home
    @survey = RandomSurveySelector.call(@cookie)
  end

  def terms_and_conditions; end
  def privacy_policy; end
  def kitchensink; end
end
