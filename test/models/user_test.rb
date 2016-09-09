require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test User', email: "user@email.com", password: 'blabla', password_confirmation: 'blabla')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '   '
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' ' * 5
    assert_not @user.valid?
  end
end
