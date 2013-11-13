require 'rest-client'
require 'arrow/notification'

module Arrow
  
  def self.push(notifications)
    notifications = Array(notifications)
    params = { notifications: notifications.collect(&:to_hash) }
    RestClient.post("#{self.server_url}/notifications", params.to_json, content_type: :json)
  end
  
  def self.broadcast_push(token_addresses, notif)
    params = {
      notification: notification.to_hash,
      token_addresses: token_addresses
    }
    RestClient.post("#{self.server_url}/broadcast_notifications", params.to_json, content_type: :json)
  end
  
  def self.feedback(app_uuid)
    RestClient.get("#{self.server_url}/feedback/#{app_uuid}")
  end
  
  def self.server_url
    url = ENV['ARROW_URL']
    raise "You must set ARROW_URL!" unless url
    url
  end
  
  
end
