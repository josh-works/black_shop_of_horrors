# This will guess the User class
FactoryGirl.define do
  factory :category do
    title "organs"
    image "www.image.png"
    slug "organs"
  end

  factory :item do
    title "Liver"
    description "Cuz your liver is not up to the task"
    price 99
    image "www.image.png"
    association :category, factory: :category
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
