require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :desc => "MyString",
      :is_complete => "MyString",
      :priority => 1,
      :attach => "",
      :user => nil,
      :list => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[desc]"

      assert_select "input[name=?]", "task[is_complete]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[attach]"

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[list_id]"
    end
  end
end
