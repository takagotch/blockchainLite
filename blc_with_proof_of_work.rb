def compute_hash_with_proog_of_work( difficulty="00" )
  nonce = 0
  loop do
    hash = calc_hash_with_nonce( nonce )
    if hash.start_with?( difficulty )
      return [nonce,hash]
    else
      nonce += 1
    end
  end
end

def calc_hash_with_nonce( nonce=0 )
  sha = Digest::SHA256.new
  sha.update( nonce.to_s + @timestamp.to_s + @previous_hash + @data )
  sha.hexdigest
end

/*pp
[#<Block:0x1e204f0
  @timestamp     = 1637-09-20 20:13:38,
  @data          = "Genesis",
  @previous_hash = "0000000000000000000000000000000000000000000000000000000000000000",
  @nonce         = 242,
  @hash          = "00b8e77e27378f9aa0afbcea3a2882bb62f6663771dee053364beb1887e18bcf">,
 #<Block:0x1e56e20
  @timestamp     = 1637-09-20 20:23:38,
  @data          = "Transaction Data...",
  @previous_hash = "00b8e77e27378f9aa0afbcea3a2882bb62f6663771dee053364beb1887e18bcf",
  @nonce         = 46,
  @hash          = "00aae8d2e9387e13c71b33f8cd205d336ac250d2828011f5970062912985a9af">,
 #<Block:0x1e2bd58
  @timestamp     = 1637-09-20 20:33:38,
  @data          = "Transaction Data......",
  @previous_hash = "00aae8d2e9387e13c71b33f8cd205d336ac250d2828011f5970062912985a9af",
  @nonce         = 350,
  @hash          = "00ea45e0f4683c3bec4364f349ee2b6816be0c9fd95cfd5ffcc6ed572c62f190">,
 #<Block:0x1fa8338
  @timestamp     = 1637-09-20 20:43:38,
  @data          = "More Transaction Data...",
  @previous_hash = "00ea45e0f4683c3bec4364f349ee2b6816be0c9fd95cfd5ffcc6ed572c62f190",
  @nonce         = 59,
  @hash          = "00436f0fca677652963e904ce4c624606a255946b921132d5b1f70f7d86c4ab8">]
*/
