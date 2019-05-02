class Api::V1::MessagesController < ApplicationController

  skip_before_action :authorized, only: [:listen]

  def create
    # create new message and broadcast
    message = Message.new(message_params)
    conversation = Conversation.find(message_params[:conversation_id])
    if message.save
      MessagesChannel.broadcast_to conversation, message
      render json: message
    end
  end

  def author
    # find which user a message belongs to (for flash messages)
    # byebug
    @message = Message.find(params[:data][:id])
    @user = User.find(@message.user_id)
    render json: @user
  end

  # REPLACED WITH SPEECH SYNTHESIS ON FRONT END
  # def listen
  #   client = Google::Cloud::TextToSpeech.new
  #   synthesis_input = { text: params[:message] }
  #   voice = {
  #     language_code: "en-US",
  #     ssml_gender:   "NEUTRAL"
  #   }
  #   audio_config = { audio_encoding: "MP3" }
  #   response = client.synthesize_speech synthesis_input, voice, audio_config
  #   File.open "output.mp3", "wb" do |file|
  #     file.write response.audio_content
  #   end
  #   render json: response
  # end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end

end
