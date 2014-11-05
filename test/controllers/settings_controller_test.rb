class SettingsControllerTest < ActionController::TestCase

  test 'should update settings' do

    post :update, settings: { STARTING_MILEAGE: 100 }

    assert_redirected_to root_path

    assert_equal '100', Setting.where(name: 'STARTING_MILEAGE').first.value

  end

end
