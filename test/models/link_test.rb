require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "should not save Link without url" do
    link = Link.new
    assert_not link.save
  end

  test "should generate slug" do
    link = Link.new(url: "https://guides.rubyonrails.org/testing.html")
    link.save
    assert link.slug
  end
end
