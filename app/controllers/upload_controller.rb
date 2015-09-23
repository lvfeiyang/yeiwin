class UploadController < ApplicationController
    def menu
        @access_token = AccessToken.find(1)
        if @access_token == nil
            @access_token = AccessToken.new(token: '0000', expires: 0)
        end
    end

    def gettoken
        sAppid = 'wxf9f4d59a5ce1e3e4'
        sAppsecret = '0022dde334503e226533925a764300b2'
        url_src = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{sAppid}&secret=#{sAppsecret}"
        
        data = get("https://api.weixin.qq.com/cgi-bin/token", {"grant_type"=>"client_credential", "appid"=>"#{sAppid}", "secret"=>"#{sAppsecret}"})

        @access_token = AccessToken.find(1)
        @access_token.update(token: data['access_token'], expires: data['expires_in'])
        render 'menu'
    end

    def addmenu
    @access_token = AccessToken.find(1)
    add_param = {button: {type: "view", name: "搜索", url: "www.baidu.com"}}
    data = post("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#{@access_token.token}", add_param)
    logger.info "ltest-#{data}"
    end


    private
    def post(url, params)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.use_ssl = true
      end
      begin
        request = Net::HTTP::Post.new(uri.request_uri)
        #request.set_form_data(params)
        request.body = params.to_json
        response = http.start { |http| http.request(request) }
        return JSON.parse response.body
      rescue =>err
        return nil
      end
    end

    def get(url, params)
        uri = URI.parse(url)
        uri.query = URI.encode_www_form(params)
        http = Net::HTTP.new uri.host, uri.port
        if uri.scheme == 'https'
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            http.use_ssl = true
        end
        begin
            request = Net::HTTP::Get.new uri.request_uri
            response = http.start { |http| http.request request }
            return JSON.parse response.body
        rescue => err
            return nil
        end
    end
end
