FactoryBot.define do
  factory :survey do
    user { nil }
    approved { false }
    style { 1 }
  end
end
