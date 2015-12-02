require_relative '../test_helper'

class UserSeesGreetingOnHomepage < FeatureTest
  def test_user_sees_greeting_on_homepage
    visit '/'

    # save_and_open_page

    within("#greeting") do
      assert page.has_content?("Welcome to THE Task Manager")
    end
  end


end