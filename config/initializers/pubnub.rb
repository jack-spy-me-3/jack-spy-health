require 'pubnub'

pubnub = Pubnub.new(
    subscribe_key: ENV["SUBSCRIBE_KEY"],
    publish_key: ENV["PUBLISH_KEY"],
)

pubnub.publish(message: 'hello', channel: 'chan')