require_relative '../test_helper'

class UserCanDeleteTasks < FeatureTest

  def test_user_can_delete_tasks
    TaskManager.create({:title       => "a title",
                        :description => "a description"})

    visit '/tasks'

    assert page.has_content?("a title")
    
    click_button('delete')

    refute page.has_content?("a title")

  end

end