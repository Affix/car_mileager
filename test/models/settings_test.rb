class SettingsTest < ActiveSupport::TestCase

  test 'should save setting' do
    setting = Setting.new
    setting.name = 'STARTING_MONTH'
    setting.value = 'July'
    assert setting.save
  end

  test 'should not save setting without valid name' do
    setting = Setting.new
    setting.name = 'Non-Valid Entry'
    setting.value = 'July'
    assert_not setting.save
  end

  test 'should not save setting without name' do
    setting = Setting.new
    setting.value = 'July'
    assert_not setting.save
  end

  test 'should not save setting without value' do
    setting = Setting.new
    setting.name = 'STARTING_MONTH'
    assert_not setting.save
  end

  test 'should not save starting month setting without valid month' do
    setting = Setting.new
    setting.name = 'STARTING_MONTH'
    setting.value = 'allister'
    assert_not setting.save
  end

end
