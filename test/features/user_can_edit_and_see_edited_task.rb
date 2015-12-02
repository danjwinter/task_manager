require_relative '../test_helper'

class UserCanEditAndSeeEditedTask < FeatureTest

  def test_user_can_edit_and_see_edited_task
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    visit '/tasks'
    # save_and_open_page
    # fill_in('task[title]', with: "badass title")
    # fill_in('task[description]', with: "badass description")


    # within("#task-title-1") do
      click_link('Edit')
      assert_equal '/tasks/1/edit', current_path
      fill_in('task[title]', with: "badassery")
      click_button('submit')
    # end

    assert_equal '/tasks/1', current_path

    within('#task-title') do
      assert page.has_content?("badassery")
    end
  end

end