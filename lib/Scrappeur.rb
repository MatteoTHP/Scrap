require 'rubygems'
require 'open-uri'
require 'nokogiri'






# ---  recup grace a l'url du site,  le code html !

def parsons
    parsed = Nokogiri::HTML(URI("https://coinmarketcap.com/all/views/all/").open)
    return parsed
end

  

# --- recupere les noms des cryptos dans l'html grace a son xpath et les met dans un array 

def names(parsed)

    crypto_names = parsed.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a")
    
    ary_crypto_names = []
    crypto_names.each do |element|
    ary_crypto_names << element.text
    
    end

    return ary_crypto_names
end 



# --- recupere les prix des cryptos dans l'html grace a son xpath et les met dans un array

def prices(parsed)

    crypto_prices = parsed.xpath("/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a")
    
    ary_crypto_prices = []

    crypto_prices.each do |element|
    
    ary_crypto_prices << element.text.gsub('$','')
    
    end

    return ary_crypto_prices
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