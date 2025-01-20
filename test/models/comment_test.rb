require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without content" do
    comment = Comment.new
    assert_not comment.save, "Saved the comment without content"
  end
end
