require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   

puts page.css("title")[0].name
puts page.css('title').text


crypto_name =  page.xpath("//tbody/tr/td[2]/div[1]/a")

a =[]
crypto_name.each do |name| 
    a << name.text
end


crypto_price =  page.xpath("//tbody/tr/td[5]/a")
b = []
crypto_price.each do |price| 
    b << price.text.gsub("$", '').to_f 
end

currencies_tab = a.zip(b).to_h
array = []
array.push(currencies_tab)
puts currencies_tab
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
puts array
