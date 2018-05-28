require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Attach", with: @task.attach
    fill_in "Desc", with: @task.desc
    fill_in "Is Complete", with: @task.is_complete
    fill_in "List", with: @task.list_id
    fill_in "Priority", with: @task.priority
    fill_in "User", with: @task.user_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Attach", with: @task.attach
    fill_in "Desc", with: @task.desc
    fill_in "Is Complete", with: @task.is_complete
    fill_in "List", with: @task.list_id
    fill_in "Priority", with: @task.priority
    fill_in "User", with: @task.user_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task was successfully destroyed"
  end
end