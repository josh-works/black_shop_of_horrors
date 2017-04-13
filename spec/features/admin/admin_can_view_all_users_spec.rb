require 'rails_helper'

describe 'When an admin visits `/admin/users`' do
  describe 'as a default user' do
    it 'they can see a 404' do
      User.create(first_name: "Admin",
                  last_name: "Admin",
                  email: "Admin@admin",
                  password: "pass",
                  password_confirmation: "pass",
                  role: 1)
      user = User.create(first_name: "user",
                  last_name: "user",
                  email: "user@user.com",
                  password: "pass",
                  password_confirmation: "pass",
                  role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path
      # admin_users_path

      expect(page).to_not have_content("Admin")
      expect(page).to_not have_content("Default")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  describe 'as an admin' do
    it 'they see a list of users' do
      admin = User.create(first_name: "Admin",
                  last_name: "Admin",
                  email: "Admin@admin",
                  password: "pass",
                  password_confirmation: "pass",
                  role: 1)
      user = User.create(first_name: "user",
                  last_name: "user",
                  email: "user@user.com",
                  password: "pass",
                  password_confirmation: "pass",
                  role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      # admin_users_path

      expect(page).to have_content("Admin")
      expect(page).to have_content("default")

    end
  end
end
