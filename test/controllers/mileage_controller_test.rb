class MileagesControllerTest < ActionController::TestCase

  include Devise::TestHelpers
  
  def setup
    sign_in User.first
  end

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
    assert_equal 'Mileage was successfully created.', flash[:notice]
  end

  test 'should display validation error when creating mileage without amount' do
    post :create, mileage: { date: '10-10-2014' }

    assert_redirected_to root_path
    assert_equal 'Mileage was not successfully created, a valid date and an amount is required.', flash[:alert]
  end

  test 'should display validation error when creating milage without date' do
    post :create, mileage: { amount: '1222' }

    assert_redirected_to root_path
    assert_equal 'Mileage was not successfully created, a valid date and an amount is required.', flash[:alert]
  end

  test 'should delete mileage' do

    entry = Mileage.first

    assert_difference('Mileage.count', -1) do
      get :delete, id: entry.id
    end

    assert_redirected_to list_path
    assert_equal 'Mileage was successfully deleted.', flash[:notice]
  end

  test 'should display validation error when attempting to delete mileage without an id' do

    get :delete

    assert_redirected_to list_path
    assert_equal 'Unable to delete as no mileage was specified.', flash[:alert]
  end

end
