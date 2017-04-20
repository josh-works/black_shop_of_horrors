class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def submit_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
