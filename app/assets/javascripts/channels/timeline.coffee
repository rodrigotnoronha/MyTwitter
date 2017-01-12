jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    App.timeline = App.cable.subscriptions.create {
        channel: 'TimelineChannel'
      },
      connected: ->
        console.log 'Conectado'
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['tweet']

      send_tweet: (tweet) ->
        @perform 'send_tweet', tweet: tweet

      $('#new_tweet').submit (e) ->
        $this = $(this)
        textarea = $this.find('#tweet_message')
        if $.trim(textarea.val()).length >= 0
          if App.timeline.send_tweet { message: textarea.val() }
            textarea.val('')
          else
            alert 'Erro ao envia mesagem'
        e.preventDefault()
        return false
