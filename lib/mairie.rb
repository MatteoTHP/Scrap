require 'rubygems'
require 'open-uri'
require 'nokogiri'






# ---  recup grace a l'url du site,  le code html !


    parsed = Nokogiri::HTML(URI("http://annuaire-des-mairies.com/val-d-oise.html").open)
   
    
    city = parsed.css('tr td p a.lientxt')
    arr_city = []
    city.each do |element| 
    arr_city << element.text.downcase
    end


    #var_cities = city.text
    # variable nom ville
    #arr_mail = []
    #var = arr_city.map{|element| element.each}
    #x = 0
    arr = []
     arr_city.each_with_index {|val, index| "#{index} "=> arr }

arr.each do
    pagination_parsed = Nokogiri::HTML(URI("http://annuaire-des-mairies.com/95/#{arr_city[arr]}.html").open)
    puts arr_city[index]
    pag_email = pagination_parsed.css(' td:contains("@")').text
    puts pag_email
    arr_mail << pag_email
    puts arr_mail
    

end 

=begin     
    html.wide.wow-animation.desktop.landscape.rd-navbar-static-linked body div.page main.page-content section.well.section-border div.container table.table.table-striped.table-mobile.mobile-primary.round-small tbody tr.txt-primary.tr-last td


    mairies.each do|mairie|
        villes{
            title: mairies.css('tr td p a.lientxt').text

        }


    html body table tbody tr td table tbody tr td p object#voyance-par-telephone table tbody tr td table.Style20 tbody tr td p a.lientxt

    /html/body/div/main/section[2]/div/table/tbody/tr[1]/td[1]/a
    html.wide.wow-animation.desktop.landscape.rd-navbar-static-linked body div.page main.page-content section.well.section-border div.container table.table.table-border.table-mobile.mobile-primary.bg-white tbody tr td a.lientxt
 

# --- recupere les noms des cryptos dans l'html grace a son xpath et les met dans un array 



    crypto_names = parsed.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a")
    
    ary_crypto_names = []
    crypto_names.each do |element|
    ary_crypto_names << element.text
    
    end

   




# --- recupere les prix des cryptos dans l'html grace a son xpath et les met dans un array



    crypto_prices = parsed.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a")
    
    ary_crypto_prices = []

    crypto_prices.each do |element|
    
    ary_crypto_prices << element.text.gsub('$','')
    
    end

   





# --- fusionne l'array noms et l'array prix dans un hash

def hash_c(ary_crypto_names,ary_crypto_prices)

    hash_crypto = Hash[ary_crypto_names.zip ary_crypto_prices]
    return hash_crypto

end


# --- trasforme l'as en plusieurs hashs dans un array...

def array_final(hash_crypto)

    array_hash =[] 

    hash_crypto.each {|element| array_hash << {element[0] => element[1]} }
    return array_hash
    
end



def perform

    parsed = parsons
    ary_crypto_names = names(parsed)
    ary_crypto_prices = prices(parsed)
    hash_crypto = hash_c(ary_crypto_names,ary_crypto_prices)
    array_hash = array_final(hash_crypto)

    
    
end

perform
=end