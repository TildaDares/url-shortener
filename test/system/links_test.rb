require "application_system_test_case"

class LinksTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit home_url
  
    assert_selector "h1", text: "URL Shortener"
    assert_no_selector ".result"
  end

  test "shortening a link" do
    visit home_url
    url = "https://guides.rubyonrails.org/testing.html"
    fill_in "url", with: url
    find('input[name="commit"]').click

    page.has_css?('.result')
    page.has_link?("#slug", href: url)
  end

  test "should not shorten link when url is invalid" do
    visit home_url
    fill_in "url", with: "testing invalid url"
    find('input[name="commit"]').click

    page.has_no_css?('.result')
  end
end
