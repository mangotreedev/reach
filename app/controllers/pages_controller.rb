class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :kitchensink ]
  # before_action :find_or_generate_cookie

  def home
    raise
    @survey = RandomSurveySelector.call
  end

  def kitchensink; end

  private

  def find_or_generate_cookie
    cookies[:reach_cookie] = SecureRandom.uuid unless cookies[:reach_cookie]
    @cookie = cookies[:reach_cookie]
  end
end
