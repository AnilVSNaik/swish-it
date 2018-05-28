require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :desc => "MyString",
      :is_complete => "MyString",
      :priority => 1,
      :attach => "",
      :user => nil,
      :list => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[desc]"

      assert_select "input[name=?]", "task[is_complete]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[attach]"

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[list_id]"
    end
  end
end
