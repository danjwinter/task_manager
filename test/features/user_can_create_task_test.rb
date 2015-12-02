require_relative '../test_helper'

class UserCanCreateNewTask < FeatureTest
  def test_user_sees_greeting_on_homepage
    visit '/tasks/new'
    # save_and_open_page
    fill_in('task[title]', with: "badass title")
    fill_in('task[description]', with: "badass description")
    click_button('submit')

    assert_equal '/tasks', current_path

    within("#task-title-1") do
      assert page.has_content?("badass title")
    end

  end

  # fill_in(identifier, with: " content")
  # click_link(identifier)
  # click_button(identifier)
  # click_link_or_button(identifier)
  #
  # assert_equal '/', current_path

end