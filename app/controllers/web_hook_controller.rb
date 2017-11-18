class WebHookController < ApplicationController

  def index
    push = JSON.parse(params["payload"])
    binding.pry
  end
end
