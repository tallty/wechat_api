class CloudClosetWechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder appid: ENV["cloud_closet_app_id"], secret: ENV["cloud_closet_app_secret"], token: ENV["cloud_closet_app_token"], access_token: Rails.root.join(ENV["cloud_closet_app_access_token"])

  def js_hash
    page_url = if controller.class.trusted_domain_fullname
                 "#{controller.class.trusted_domain_fullname}#{controller.request.original_fullpath}"
               else
                 controller.request.original_url
               end
    @js_hash = controller.wechat.jsapi_ticket.signature(page_url)
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end
