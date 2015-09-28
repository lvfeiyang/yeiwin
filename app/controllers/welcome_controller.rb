require 'digest/sha1'
require 'rexml/document'

class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    if checksign
      #logger.debug "ltest-#{params}"
      #if params[:xml][:MsgType] == "text"
      if true
        #body = JSON.parse request.body
        body = REXML::Document.new(request.body)
        @body = Hash.from_xml(body.to_s)
        temp = @body['xml']["FromUserName"]
        logger.debug "ltest_1-params:#{params}, 01-#{temp}, 2-#{@body}"
        render 'index1', layout: false, :formats => :xml
      else
        logger.debug "ltest_2"
        render text: params[:echostr]
      end
    end
  end

  private
  def checksign
      aSign = Array["sy250", params[:timestamp], params[:nonce]]
      #return Digest::SHA1.hexdigest(aSign.sort.join('')) == params[:signature]
      return true
  end
end
