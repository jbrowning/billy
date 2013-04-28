FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User #{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :billing_period do
    user
    begin_date { Date.current - 1.week }
    end_date   { Date.current + 1.week }
  end

  factory :billing_period_range do
    user
    begin_date 1
    end_date -1
  end

  factory :recurring_bill do
    user
    billing_period_range
    sequence(:name) {|n| "Bill #{n}" }
  end

  factory :bill do
    user
    sequence(:name) {|n| "Bill #{n}" }
    amount_cents { rand(100) * 100 }

    trait :settled do
      settled true
    end

    trait :unsettled do
      settled false
    end
  end
end
