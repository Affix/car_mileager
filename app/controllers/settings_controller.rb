class SettingsController < ApplicationController

  def update

    params[:settings].each do |n, v|
      unless Setting.update_setting(current_user.id, n, v)
        redirect_to root_path, alert: 'There was an issue updating your settings, make sure a valid month, and amounts are set.'
        return
      end
    end

    redirect_to root_path, notice: 'Settings where successfully updated.'
  end

end
