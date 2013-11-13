module Arrow
  class Notification
    
    attr_accessor :token_address, :alert, :badge, :sound, :content_available, :custom_data
    
    def initialize(opts = {})
      @token_address        = opts.delete(:token_address)
      @alert                = opts.delete(:alert)
      @badge                = opts.delete(:badge)
      @sound                = opts.delete(:sound)
      @content_available    = opts.delete(:content_available)
      @custom_data          = opts.delete(:custom_data)
    end
    
    def to_hash
      hash = { token_address: @token_address }
      
      hash[:alert]              = @alert if @alert
      hash[:badge]              = @badge if @badge
      hash[:sound]              = @sound if @sound
      hash[:content_available]  = @content_available if @content_available
      hash[:custom_data]        = @custom_data if @custom_data
      hash
    end
    
  end
end