# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://www.languagedaily.com/learn-german/vocabulary/common-german-words'))
@words = []

p 'start seeding'

page.css('tr').each do |row|
  orig = row.xpath('td[2]')
  trans = row.xpath('td[3]')
  @words << {original_text: orig.text, translated_text: trans.text}
end

Card.create(@words)

p 'finishing seeding'