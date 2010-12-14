require 'helper'

class TestPistachio < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Pistachio.new :default, :adapter => :redis, 
                            :namespace => 'test_pistachio'
  end
  
  def test_sending_messages
    app[:lolendpoint] << 'ohai'
    
    get "/push_messages/lolendpoint"
    
    assert last_response.ok?
    assert_equal "ohai", last_response.body
  end
end