set :output, '/flashcards/log/cron.log'

every 1.day, :at => '16:09 pm' do
  runner 'Card.send_notification'
end
