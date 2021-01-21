require_relative '../lib/Scrappeur.rb'





describe "the array" do
    it "should return a hash" do
      expect(ary_crypto_names[0]).to eq("Bitcoin") 
      expect(ary_crypto_names[1]).to eq("Ethereum")
      expect(ary_crypto_names[2]).to eq("Tether")
    end
 
end
