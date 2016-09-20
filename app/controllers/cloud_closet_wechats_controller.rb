class CloudClosetWechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder appid: ENV["cloud_closet_app_id"], secret: ENV["cloud_closet_app_secret"], token: ENV["cloud_closet_app_token"],
      access_token: Rails.root.join(ENV["cloud_closet_app_access_token"]), jsapi_ticket: Rails.root.join(ENV["cloud_closet_app_jsapi_ticket"])

  def js_hash
    page_url = if self.class.trusted_domain_fullname
                 "#{self.class.trusted_domain_fullname}#{self.request.original_fullpath}"
               else
                 self.request.original_url
               end
    @js_hash = self.wechat.jsapi_ticket.signature(page_url)
    render json: @js_hash
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end
