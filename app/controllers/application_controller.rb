class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :populate_settings, if: :signed_in?


  def populate_settings
    @STARTING_MONTH = 'January'
    @YEARLY_MILEAGE = 10_000
    @STARTING_MILEAGE = 0

    settings = Setting.where(user_id: current_user.id)

    settings.each do |setting|
      unless setting.name.empty?
        instance_variable_set("@#{setting.name}", setting.value)
      end
    end

  end

end
