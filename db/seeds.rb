require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.mediacollege.com/linux/command/linux-command.html'))

doc.search('//table/tr').each do |row| # с каждым рядом указанной таблицы документа сделать следующее:
  original = row.search('td[2]')[0].content.downcase # взять значение ячейки 2 каждого ряда
  translated = row.search('td[1]')[0].content.downcase # взять значение ячейки 1 каждого ряда
  Card.create!(original_text: original, translated_text: translated)

end
