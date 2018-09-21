class Block
  attr_reader :timestamp
  attr_reader :data
  attr_reader :previous_hash
  attr_reader :hash
  
  def initialize(data, previous_hash)
    @timestamp = Time.now
    @data = data
    @previous = previous_hash
    @hash = calc_hash
  end
  
  def self.first( data="Fenesis" )
    Block.new( data, "0000000000000000" )
  end
  
  def self.next
    Block.new( data, previous.hash )
  end
  
  private
  
  def calc_hash
    sha = Digest::SHA256.new
    sha.update( @timestamp.to_s + @previous_hash + @data )
    sha.hexdigest
  end
end

b0 = Block.first( "Genesis" )
b1 = Block.next( b0, "Transaction Data..." )
b2 = Block.next( b1, "Transaction Data..." )
b3 = Block.next( b2, "More Transaction Data..." )

blockchain = [b0, b1, b2, b3]

pp blockchain

/*pp
[#<Block:0x1eed2a0
  @timestamp     = 1637-09-15 20:52:38,
  @data          = "Genesis",
  @previous_hash = "0000000000000000000000000000000000000000000000000000000000000000",
  @hash          = "edbd4e11e69bc399a9ccd8faaea44fb27410fe8e3023bb9462450a0a9c4caa1b">,
 #<Block:0x1eec9a0
  @timestamp     = 1637-09-15 21:02:38,
  @data          = "Transaction Data...",
  @previous_hash = "edbd4e11e69bc399a9ccd8faaea44fb27410fe8e3023bb9462450a0a9c4caa1b",
  @hash          = "eb8ecbf6d5870763ae246e37539d82e37052cb32f88bb8c59971f9978e437743">,
 #<Block:0x1eec838
  @timestamp     = 1637-09-15 21:12:38,
  @data          = "Transaction Data......",
  @previous_hash = "eb8ecbf6d5870763ae246e37539d82e37052cb32f88bb8c59971f9978e437743",
  @hash          = "be50017ee4bbcb33844b3dc2b7c4e476d46569b5df5762d14ceba9355f0a85f4">,
 #<Block:0x1eec6d0
  @timestamp     = 1637-09-15 21:22:38,
  @data          = "More Transaction Data...",
  @previous_hash = "be50017ee4bbcb33844b3dc2b7c4e476d46569b5df5762d14ceba9355f0a85f4",
  @hash          = "5ee2981606328abfe0c3b1171440f0df746c1e1f8b3b56c351727f7da7ae5d8d">]
*/
