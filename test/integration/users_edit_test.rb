require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:liwenhang)
  end

  test "unsuccessful edit" do
  	  get edit_user_path(@user)
  	  assert_template 'users/edit'
  	  patch user_path(@user), params: { user: { name: "",
  		                                       email: "bibu@wew",
  		                                       password:              "foo",
  		                                       password_confirmation: "bar" } }
      assert_template 'users/edit'
	end
  end
  		



