set :output, '/flashcards/log/cron.log'

# every 1.day, :at => '00:0 am' do
#   runner 'Card.send_notification'
# end

every :hour do
  runner 'Card.send_notification'
end
