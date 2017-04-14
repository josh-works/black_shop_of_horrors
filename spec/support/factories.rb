# This will guess the User class
FactoryGirl.define do
  factory :category do
    title "organs"
    image "www.image.png"
    slug "organs"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end
