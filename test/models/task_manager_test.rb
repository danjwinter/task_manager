require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_all_returns_an_array_of_all_task_objects
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    TaskManager.create({:title       => "a title",
                        :description => "a description"})

    all_tasks = TaskManager.all

    assert_equal 4, all_tasks.count
    assert_equal Array, all_tasks.class
    assert_equal [Task, Task, Task, Task], all_tasks.map {|task| task.class}
    assert_equal [1, 2, 3, 4], all_tasks.map {|task| task.id}
  end

  def test_find_returns_correct_task
    TaskManager.create({:title       => "1a title",
                        :description => "1a description"})
    TaskManager.create({:title       => "2a title",
                        :description => "2a description"})
    TaskManager.create({:title       => "3a title",
                        :description => "3a description"})

    task1 = TaskManager.find(1)
    task2 = TaskManager.find(2)
    task3 = TaskManager.find(3)

    assert_equal 1, task1.id
    assert_equal "1a title", task1.title
    assert_equal "1a description", task1.description

    assert_equal 2, task2.id
    assert_equal "2a title", task2.title
    assert_equal "2a description", task2.description

    assert_equal 3, task3.id
    assert_equal "3a title", task3.title
    assert_equal "3a description", task3.description
  end

  def test_update_edits_and_stores_attributes_for_correct_task
    TaskManager.create({:title       => "1a title",
                        :description => "1a description"})
    TaskManager.create({:title       => "2a title",
                        :description => "2a description"})
    TaskManager.create({:title       => "3a title",
                        :description => "3a description"})

    task1 = TaskManager.find(1)
    task2 = TaskManager.find(2)
    task3 = TaskManager.find(3)

    TaskManager.update(1, {:title       => "a rad fuckin title",
                        :description => "3a description",
                        :id => 1})

    task1 = TaskManager.find(1)
    refute_equal "1a title", task1.title
    assert_equal "a rad fuckin title", task1.title
    refute_equal "a rad fuckin title", task2.title
    refute_equal "a rad fuckin title", task3.title
  end
  #all, find, update, destroy
end