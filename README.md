Arrow
==============


Installation
-----------------

    ```ruby
    gem 'arrow-ruby', git: 'https://github.com/mwhuss/arrow-ruby.git'
    ```
    
Set the `ARROW_URL` ENV var to the Arrow server URL.

Usage
-----------------

Since the Arrow service supports multiple different APNS endpoints it needs to know which app identifier to route the message to. The service uses a **token address** which is a token in for format of `token@app_identifier`.

    ```ruby
    # Build a notification
    notif = Arrow::Notification.new
    notif.token_address = "abc123@com.teamtreehouse.Treehouse"
    notif.alert = "Hello!"
    
    # Send a notification
    Arrow.push(notif)
    
    # Send multiple notifications
    Arrow.push(array_of_notifs)
    
    # Send a broadcast. This method takes an array of token addresses and a single notif to send to everyone.
    Arrow.broadcast_push(token_addresses, notif)
    
    # Query the APNS feedback service for tokens that are no longer valid
    Arrow.feedback('com.teamtreehouse.Treehouse')
    ```