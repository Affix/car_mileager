class SettingsController < ApplicationController

  def update
    params[:settings].each do |n, v|
      Setting.where(name: n).update_all(value: v)
    end

    redirect_to root_path, notice: "Settings where successfully updated."
  end

end
