require "mobile_system_test_case"

class MobilePostsTest < MobileSystemTestCase
  setup do
    @user = users(:one)
    login_as @user
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "文章"
  end
end
