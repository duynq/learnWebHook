class WebHookController < ApplicationController

  before_action :load_chat_work, :load_notify, only: :index

  def index
    push = JSON.parse(params["payload"])
    content = get_content_message[:comment]
    send_message_chatwork content if @push["action"] == "created"
  end

  private

  def load_chat_work
    ChatWork.api_key = "deaaf5157aeb452dbe06af474d75b2ae"
  end

  def load_notify
    @push = JSON.parse(params["payload"])
  end

  def get_content_message
    if @push["action"] == "created"
      body = @push["comment"]["body"]
    end
    {
      comment: body
    }
  end

  def send_message_chatwork content
    content_message = "[To:2498782] Nguyen Van Thieu \n #{content}"
    ChatWork::Message.create room_id: "90052116",
      body: content_message
  end
end
