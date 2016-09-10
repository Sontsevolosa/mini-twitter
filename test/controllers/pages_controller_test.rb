require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def setup
    @user = User.new(name: 'Test User', email: "user@email.com", password: 'blabla', password_confirmation: 'blabla')
  end

  test 'should get home' do
    get :home
    assert_response :success
  end
end
