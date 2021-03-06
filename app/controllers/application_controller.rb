class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_or_generate_cookie
  add_flash_types :info, :success, :sweetalert, :clipboard_trigger

  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :agree_terms])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def after_sign_in_path_for(resource)
    surveys_path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def find_or_generate_cookie
    if cookies[:reach_cookie_monster]
      cookies[:reach_cookie] = SecureRandom.uuid unless cookies[:reach_cookie]
      @cookie ||= cookies[:reach_cookie]
    else
      @cookie = SecureRandom.uuid
    end
    @show_policy = cookies[:reach_shown_policy].nil?
  end
end
