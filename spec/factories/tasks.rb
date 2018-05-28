FactoryBot.define do
  factory :task do
    desc "MyString"
    is_complete "MyString"
    priority 1
    attach ""
    user nil
    list nil
  end
end
