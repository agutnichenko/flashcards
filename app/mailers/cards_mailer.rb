class CardsMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def pending_cards_notification(user)
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'you have cards ready for translation')
  end
end
