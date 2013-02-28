FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User #{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :billing_period do
    user
    begin_date 1
    end_date -1
  end

  factory :billing_schedule do
    billing_period
    sequence(:name) {|n| "Bill #{n}" }
  end
end
