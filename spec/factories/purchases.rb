FactoryGirl.define do
  factory :purchase do
    charge_id "MyString"
    amount 1
    user nil
    artwork nil
  end
end
