require 'digest/sha1'

class WelcomeController < ApplicationController
  def index
    if checksign
      logger.info "ltest-#{params}"
      if params[:xml][:MsgType] == "text"
        render "index", layout: false, :formats => :xml
      else
        render text: params[:echostr]
      end
    end
  end

  private
  def checksign
      aSign = Array["sy250", params[:timestamp], params[:nonce]]
      return Digest::SHA1.hexdigest(aSign.sort.join('')) == params[:signature]
  end
end
