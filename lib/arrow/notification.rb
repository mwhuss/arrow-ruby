module Arrow
  class Notification
    
    attr_accessor :token_address, :alert
    
    def initialize(opts = {})
      @token_address = opts.delete(:token_address)
      @alert = opts.delete(:alert)
    end
    
    def to_hash
      {
        token_address: @token_address,
        alert: @alert
      }
    end
    
  end
end