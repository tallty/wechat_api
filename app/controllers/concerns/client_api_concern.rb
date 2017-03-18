module ClientApiConcern
  extend ActiveSupport::Concern

  included do
    def js_hash
      page_url = params[:page_url]
      logger.info "js_hash request page_url is:#{page_url}"
      @js_hash = self.wechat.jsapi_ticket.signature(page_url)
      logger.info "js_hash response is:#{@js_hash}"
      render json: @js_hash
    end

    def web_access_token
      code = params[:code]
      logger.info "web_access_token request code is:#{code}"
      @access_token = self.wechat.web_access_token(code)
      logger.info "web_access_token response is:#{@access_token}"
      render json: @access_token
    rescue Wechat::ResponseError => e
      logger.info "web_access_token response is:#{e.inspect}"
      render json: { error: e.message, error_code: e.error_code }, status: 400
    end

    def template_message
      template = params[:template]
      openid = params[:openid]
      logger.info "template_message template is:#{template.inspect}"
      response = wechat.template_message_send Wechat::Message.to(openid).template(template)
      logger.info "template_message response is:#{response}"
      render json: response
    end

    def user_wechat_info
      openid = params[:openid]
      response = wechat.user(openid)
      render json: response
    rescue Wechat::ResponseError => e
      logger.info "user_wechat_info error response is:#{e.inspect}"
      render json: { error: e.message, error_code: e.error_code}, status: 400
    end
  end
end