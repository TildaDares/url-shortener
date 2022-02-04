require 'test_helper'

class LinkFlowsTest < ActionDispatch::IntegrationTest
  test "get home page" do
    get '/'
    assert_select 'h1', "URL Shortener"
  end
end
