require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "team", email: "team@protovo.com", password: "protovo", admin: true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end


  test "should get new" do
    session[:user_id] = @user.id
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    #get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports" }
    end
    assert_redirected_to categories_path
  end

end
