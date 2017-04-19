require 'rails_helper'


describe ApplicationMailer do
  describe ".submit_email" do
    it "sends an email to the user" do
      user = User.create!(first_name: "Regular",
                          last_name: "min",
                          email: "user@user.com",
                          password: "user",
                          password_confirmation: "user",
                          role: 0)
      expect(ApplicationMailer.submit_email(user).to ).to eq([user.email])
      expect(ApplicationMailer.submit_email(user).subject ).to eq("Sample Email")
    end
  end

end
