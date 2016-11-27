FactoryGirl.define do
  factory :user do
    email "tom@gmail.com"
    username "tommasina"
    password "password"
    password_confirmation "password"
  end
  # <factories for each model go here>
end

