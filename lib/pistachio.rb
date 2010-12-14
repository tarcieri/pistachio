require 'rack'
require 'stash'

class Pistachio  
  def initialize(connection_name, options = {})
    unless connection_name == :default
      raise ArgumentError, "only the default connection is supported, sorry"
    end
    
    opts = {
      :path    => '/push_messages',
      :adapter => 'redis',
      :host    => 'localhost',
      :timeout => 30
    }.merge(options)
    
    @path    = opts[:path]
    @timeout = opts[:timeout]
    
    Stash.setup :default, opts
  end
  
  # Retrieve a Pistachio endpoint for the default connection
  def [](endpoint)
    Stash::List[endpoint]
  end
  
  def call(env)
    request = Rack::Request.new(env)
    result = request.path.match(/^#{@path}\/(\w+)$/) 
    return unless result
    
    endpoint = result[1]
    begin
      message = Stash::List[endpoint].bshift @timeout
      [200, {'Content-Type' => 'text/plain'}, message]
    rescue Stash::TimeoutError
      [504, {'Content-Type' => 'text/plain'}, "Timeout waiting for response"]
    end
  end
end
