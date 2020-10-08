require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

deputy_url_selector = page.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href')
deputy_url = []

deputy_name_selector = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
deputy_name = []
deputy_first_name = []
deputy_last_name = []

hash_par_depute_firstname = {}
hash_par_depute_lastname = {}


a = []



# def get_deputy_email(url_access)
#     url_begin = "http://www2.assemblee-nationale.fr"
#     #deputy_url.each do |mail|
#         page = Nokogiri::HTML(URI.open("#{url_begin + url_access}"))
#         deputy_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
#         #hash_par_depute.store("email", page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text)
#         #a << hash_par_depute_email
#         return deputy_email
# end

#>> GET DEPUTY NAME
deputy_name_selector.each do |name|
    hash_par_depute = {}
    deputy_name << name.text
    deputy_first_name << name.text.split[1]
    deputy_last_name << name.text.split[2..-1].join(' ')

    hash_par_depute.store("first name", name.text.split[1])
    hash_par_depute.store("last name", name.text.split[2..-1].join(' '))
    
    deputy_url = name["href"]
    #puts deputy_url

    url_begin = "http://www2.assemblee-nationale.fr"
    page = Nokogiri::HTML(URI.open("#{url_begin + deputy_url}"))
    deputy_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text

    #puts deputy_email

    hash_par_depute.store("email", deputy_email)

    a << hash_par_depute

end
puts  a
         

# deputy_first_name = []
# deputy_last_name = []

#>> GET DEPUTY URL

# deputy_url_selector.each do |selector|
#     deputy_url << selector.text
# end

# puts deputy_url

#>> GET DEPUTY EMAIL





# puts a


# hash_par_depute = hash_par_depute_name.merge(hash_par_depute_lastname)


# puts  "#{ a   }  #{a.class}"