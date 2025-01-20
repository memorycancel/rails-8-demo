require "test_helper"

class BlogFlowTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_one)
    @user = users(:one)
    login_as @user
  end

  test "can see the welcome page" do
    get "/"
    assert_select "h1", "文章"
  end

  test "can create an post" do
    get "/posts/new"
    assert_response :success

    post "/posts",
      params: { post: { title: "can create", body: "posts successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "p", "Post was successfully created."
  end

  test "can delete an post" do
    delete post_url(@post)
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "p", "Post was successfully destroyed."
  end
end
