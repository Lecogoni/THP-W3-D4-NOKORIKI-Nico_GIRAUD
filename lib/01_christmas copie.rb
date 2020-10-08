require 'nokogiri' 
require 'open-uri'

a = []
my_hash = {}

# RECUP url ville val d'oise

page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))   

cities_link_path = page.xpath('//a[@class="lientxt"]/@href')
url_begin = "http://annuaire-des-mairies.com/"
city_url = []

cities_name_path = page.xpath('//a[@class="lientxt"]')
city_name = []



cities_name_path.each do |name|
    #city_name << name.text
    
    url = name['href']
    city_url << url_begin + url[2..-1]



    
end


city_email = []

city_url.each do |mail|

    page = Nokogiri::HTML(URI.open("#{mail}"))
    city_email << page.xpath('//html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end

# puts city_email

currencies_tab = city_name.zip(city_email).to_h
puts currencies_tab