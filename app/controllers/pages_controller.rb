class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]
  # before_action :find_or_generate_cookie

  def home
    raise
    @survey = RandomSurveySelector.call
  end

  def kitchensink; end


end
