require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    login_as @user
  end

  test "viewing the index" do
    visit posts_path
    assert_selector "h1", text: "文章"
  end

  test "should create Post" do
    visit posts_path

    click_on "New post"

    fill_in "Title", with: "Creating an Post"
    # https://stackoverflow.com/questions/10804897/how-to-fill-hidden-field-with-capybara
    # https://medium.com/eighty-twenty/testing-the-trix-editor-with-capybara-and-minitest-158f895ad15f

    # fill_in "Body", with: "Created this article successfully!" # 因为是hidden 找不到
    find(:xpath, "//*[@id='post_body']").click(with: "Created this article successfully!")

    click_on "Create Post"

    assert_text "Creating an Post"
  end
end
