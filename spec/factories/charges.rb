FactoryGirl.define do
  factory :charge do
    customer 1
    amount 1
    description ""
    currency "MyString"
  end
end
