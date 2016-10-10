FactoryGirl.define do #if the model does not have the same name as the factory we have to add: , class: ...
  sequence :email do |n|
    "person#{n}@example2.com"
  end

  factory :user do
    email
    password "1234567890"
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password "qwertyuiop"
    first_name "Admin"
    last_name "User"
  end
end
