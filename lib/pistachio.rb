require 'rack'

class Pistachio
  def initialize(options = {})
    opts = {
      :path    => '/push_messages',
      :adapter => 'redis',
      :host    => 'localhost'
    }.merge(options)
    
    @path = opts[:path]
  end
  
  def call(env)
    request = Rack::Request.new(env)
    [200, {'Content-Type' => 'text/plain'}, "Sup"]
  end
end
