require 'rest-client'
require 'arrow/notification'

module Arrow
  
  module ClassMethods
    attr_accessor :server_url
  
    def push(notifications)
      notifications = Array(notifications)
      params = { notifications: notifications.collect(&:to_hash) }
      RestClient.post("#{self.server_url}/notifications", params.to_json, content_type: :json)
    end
  
    def broadcast_push(token_addresses, notification)
      params = {
        notification: notification.to_hash,
        token_addresses: token_addresses
      }
      RestClient.post("#{self.server_url}/batch_notifications", params.to_json, content_type: :json)
    end
  
    def feedback(app_uuid)
      response = RestClient.get("#{self.server_url}/feedback/#{app_uuid}")
      JSON.parse(response)
    end
  
    def server_url
      @server_url || ENV['ARROW_URL'] || raise("You must set Arrow.server_url or the ARROW_URL env var!")
    end
  end
  
  class << self
    include ClassMethods
  end
  
end
