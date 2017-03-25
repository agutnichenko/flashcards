class CardsMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def pending_cards_notification(email)
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'you have cards ready for translation')
  end

end
