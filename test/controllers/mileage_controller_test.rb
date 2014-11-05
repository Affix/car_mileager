class MileagesControllerTest < ActionController::TestCase

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get graph data' do
    get :populate_graph
    assert_response :success
  end

  test 'should get list' do
    get :list
    assert_response :success
    assert_not_nil assigns(:mileages)
  end

  test 'should create mileage' do

    assert_difference('Mileage.count') do
      post :create, mileage: { date: '10-10-2014', amount: 600 }
    end

    assert_redirected_to root_path
  end

  test 'should delete mileage' do

    entry = Mileage.first

    assert_difference('Mileage.count', -1) do
      get :delete, id: entry.id
    end

    assert_redirected_to list_path
  end

end
