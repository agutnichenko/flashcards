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

page.xpath("//td[2]").each do |or_words|
  p or_words.text
  Card.create(original_text: or_words.text)
end

page.xpath("//td[3]").each do |tr_words|
  Card.create(translated_text: tr_words.text)
end