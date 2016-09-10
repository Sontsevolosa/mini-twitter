require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.new(name: 'Test User', email: "user@email.com", password: 'blabla', password_confirmation: 'blabla')
  end

  test 'should get new' do
    get :new
    assert_response :success
  end
end
