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
@timestamp = 
@data =
@previous_hash =
@hash = "">,
#<Block:0x1eed2a0
@timestamp = 
@data =
@previous_hash =
@hash = "">
#<Block:0x1eed2a0
@timestamp = 
@data =
@previous_hash =
@hash = "">
#<Block:0x1eed2a0
@timestamp = 
@data =
@previous_hash =
@hash = "">
*/
