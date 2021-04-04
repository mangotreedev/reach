FactoryBot.define do
  factory :report do
    reason { "MyString" }
    survey { nil }
    resolved { false }
  end
end
