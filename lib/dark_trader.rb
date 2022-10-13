require 'rubygem'
require 'nokogiri'
require 'open-uri'

def scrapper
    doc = Nokogiri::HTML {URI.open('https://coinmarketcap.com/all/views/all/')}
end

def fusion(tab1,tab2)
    return Hash[tab1.zip(tab2)]
end

def crypto(page)
    array_name = []
    array_value = []
    name_of_crypto = page.xpath('//tr//td[3]')
    value_of_crypto = page.xpath('//tr//td[5]')
    hash = {}
    name_of_crypto.each{ |name|
        array_name<<name.text
    }
    value_of_crypto.each{|price|
    array_value << price.text
    }
    hash = fusion(array_name,array_value)
    return hash
end




