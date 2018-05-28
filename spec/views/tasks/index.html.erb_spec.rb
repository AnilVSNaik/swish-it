require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :desc => "Desc",
        :is_complete => "Is Complete",
        :priority => 2,
        :attach => "",
        :user => nil,
        :list => nil
      ),
      Task.create!(
        :desc => "Desc",
        :is_complete => "Is Complete",
        :priority => 2,
        :attach => "",
        :user => nil,
        :list => nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Is Complete".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
