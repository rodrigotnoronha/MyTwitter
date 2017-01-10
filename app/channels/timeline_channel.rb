class TimelineChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'timeline_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('timeline_channel', data)
  end

  def send_tweet(data)
    Tweet.create!(message: data['tweet']['message'])
  end
end
