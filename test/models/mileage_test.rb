class MileageTest < ActiveSupport::TestCase

  test 'should save mileage' do
    mileage = Mileage.new
    mileage.date = '12-12-2014'
    mileage.amount = 42
    assert mileage.save
  end

  test 'should not save mileage without date' do
    mileage = Mileage.new
    mileage.amount = 500
    assert_not mileage.save
  end

  test 'should not save mileage without amount' do
    mileage = Mileage.new
    mileage.date = '01-01-2014'
    assert_not mileage.save
  end

  test 'should not save mileage without valid date' do
    mileage = Mileage.new
    mileage.date = 'not a date'
    mileage.amount = 42
    assert_not mileage.save
  end

  test 'should not save mileage with negative value' do
    mileage = Mileage.new
    mileage.date = '01-01-1970'
    mileage.amount = -19
    assert_not mileage.save
  end

end
