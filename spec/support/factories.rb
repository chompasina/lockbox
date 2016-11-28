FactoryGirl.define do
  factory :user do
    email 
    username "tommasina"
    password "password"
    password_confirmation "password"
  end
  
  factory :link do
    url "http://www.google.com"
    title "Google"
    read false
    user 
  end
  
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

