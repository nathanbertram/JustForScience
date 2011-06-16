require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "successful create should redirect to root" do
    post :create, :suggestion => {:email => "andrew@nathan.com", :message => "This works, bro!"}
    assert_redirected_to root_path
  end
  
  test "unsuccessful create should redirect to new with error" do
    post :create, :suggestion => {:message => "No email, will fail"}
    assert_template :new
  end
  
end
