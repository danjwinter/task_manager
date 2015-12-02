require_relative '../test_helper'

class UserCanDeleteTasks < FeatureTest

  def test_user_can_delete_tasks
    TaskManager.create({:title       => "a title",
                        :description => "a description"})

    visit '/tasks'

    within('#task-title-1') do
      assert page.has_content?("a title")
    end

    click_button('delete')

    refute page.has_content?("a title")
    refute page.has_css?('#task-title-1')
  end

end