class CardsMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def pending_cards_notification(user)
    @user = user
    @email = user.email
    @url = 'http://example.com/login'
    mail(to: @email, subject: 'you have cards ready for translation')
  end
end
