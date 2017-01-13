class TimelineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users:#{current_user.id}:timeline_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('timeline_channel', data)
  end

  def send_tweet(data)
    TweetBroadcastJob.perform_later data, current_user.id
  end
end
