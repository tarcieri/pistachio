require 'rack'
require 'stash'
require 'pistachio/middleware'

module Pistachio
  class << self
    attr_reader :path, :timeout
  
    def setup(connection_name, options = {})
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
      true
    end
  
    # Retrieve a Pistachio endpoint for the default connection
    def [](endpoint)
      Stash::List[endpoint]
    end
  end
end
