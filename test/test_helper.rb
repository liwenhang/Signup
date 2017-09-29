require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper
  # Add more helper methods to be used by all tests here...
  #如果用户已登录，返回true
  def is_logged_in?
  	!session[:user_id].nil?
  end

  #登入指定用户
  def log_in_as(user)
  	session[:user_id] = user.user_id
  end

  class ActionDispatch::IntegrationTest
  	#登入指定用户
  	def log_in_as(user,password: 'password',remember_me: '1')
  		post login_path, params:{ session: { email:user.email,
  											 password:password,
  											 remember_me: remember_me } }
  	end
  end

end