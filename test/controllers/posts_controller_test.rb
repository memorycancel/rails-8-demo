require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post_one)
    @user = users(:one)
    login_as @user
  end

  test "should get index" do
    # get posts_url
    get posts_url, headers: { "Content-Type": "text/plain", "HTTP_REFERER": "http://example.com/posts" }
    assert_response :success

    assert_equal "index", @controller.action_name
    # assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Post", @response.body
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last, locale: 'zh') # 测试 locale： 默认会变成 zh
    assert_equal "Post was successfully created.", flash[:notice] # 测试flash
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post, locale: 'zh')
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url(locale: 'zh')
  end
end
