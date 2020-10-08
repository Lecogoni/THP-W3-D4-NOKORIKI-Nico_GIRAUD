# require 'rubygems'
require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(URI.open("http://ruby.bastardsbook.com"))   
puts page.class   # => Nokogiri::HTML::Document
puts page.css("title")[0].name
puts page.css('title').text
puts page.css('li')[1]['href']
puts page.css('div.front-matter sixco')[0]
puts page.xpath('//a')



