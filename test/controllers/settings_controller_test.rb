class SettingsControllerTest < ActionController::TestCase

  test 'should update settings' do
    post :update, settings: { STARTING_MILEAGE: 100 }
    assert_redirected_to root_path
    assert_equal '100', Setting.where(name: 'STARTING_MILEAGE').first.value
    assert_equal 'Settings where successfully updated.', flash[:notice]
  end

  test 'should display error if month is not valid' do
    post :update, settings: { STARTING_MONTH: 'ori' }
    assert_redirected_to root_path
    assert_equal 'There was an issue updating your settings, make sure a valid month, and amounts are set.', flash[:alert]
  end

  test 'should display error if starting mileage is not specified' do
    post :update, settings: { STARTING_MILEAGE: nil }
    assert_redirected_to root_path
    assert_equal 'There was an issue updating your settings, make sure a valid month, and amounts are set.', flash[:alert]
  end

end
