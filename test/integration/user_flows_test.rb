require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest

  test 'create then delete a record' do

    get '/'
    assert_response :success

    post_via_redirect '/create', mileage: { date: '5-10-2014', amount: 600 }
    assert_equal root_path, path

    get '/list'
    assert_response :success
    assert assigns(:milages)

    entry = Mileage.last
    get_via_redirect '/delete', id: entry.id
    assert_equal list_path, path
    assert_response :success

  end

  test 'update settings' do

    get '/'
    assert_response :success

    post_via_redirect '/settings/update', settings: { YEARLY_MILEAGE: 10_000 }
    assert_equal root_path, path


  end

end
