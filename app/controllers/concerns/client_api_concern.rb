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
    end
  end
end