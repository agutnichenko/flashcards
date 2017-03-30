set :output, '/flashcards/log/cron.log'

# every 1.day, :at => '00:0 am' do
#   runner 'Card.send_notification'
# end

every 1.minute do
  runner 'Card.send_notification'
end
