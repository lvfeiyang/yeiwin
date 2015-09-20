require 'digest/sha1'

class WelcomeController < ApplicationController
  def index
    if checksign
        render text: params[:echostr]
  end

  private
  def checksign
      aSign = Array["sy250", params[:timestamp], params[:nonce]]
      return Digest::SHA1.hexdigest(aSign.sort.join('')) == params[:signature]
  end
end
