module Pistachio
  class Middleware
    def initialize(app)
      # Matches messages that should be processed by Pistachio
      @path_regex = /^#{Pistachio.path}\/(\w+)$/
      @timeout = Pistachio.timeout
    end
    
    def call(env)
      request = Rack::Request.new(env)
      result = request.path.match(@path_regex) 
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
end
