require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "Sports")
  end

  test "get new category form and create category" do
    get new_category_url
    assert_response :success

    assert_difference("Category.count", 1) do
      post categories_url, params: { category: { name: "Travel" } }
    end

    follow_redirect!
    assert_response :success
    assert_match "Travel", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_url
    assert_response :success

    assert_no_difference("Category.count") do
      post categories_url, params: { category: { name: "" } }
    end

    assert_response :unprocessable_entity  # Expecting a 422 error
  
  end
end
