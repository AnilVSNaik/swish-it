require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :desc => "Desc",
      :is_complete => "Is Complete",
      :priority => 2,
      :attach => "",
      :user => nil,
      :list => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Desc/)
    expect(rendered).to match(/Is Complete/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
