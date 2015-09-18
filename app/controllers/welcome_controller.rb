class WelcomeController < ApplicationController
  def index
    render text: params[:echostr]
  end
end
