class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]

  def home
    @survey = RandomSurveySelector.call(@cookie)
  end

  def kitchensink; end


end
