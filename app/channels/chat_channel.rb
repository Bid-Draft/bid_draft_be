# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
    def subscribed
        binding.pry
    end
end
