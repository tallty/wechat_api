class CloudClosetWechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder appid: ENV["cloud_closet_app_id"], secret: ENV["cloud_closet_app_secret"], token: ENV["cloud_closet_app_token"],
      access_token: Rails.root.join(ENV["cloud_closet_app_access_token"]), jsapi_ticket: Rails.root.join(ENV["cloud_closet_app_jsapi_ticket"])

  include ClientApiConcern

  def wx_pay_options
    {
      appid: ENV["cloud_closet_app_id"],
      mch_id: ENV["cloud_closet_mch_id"],
      key: ENV["cloud_closet_key"]
    }
  end

  def wx_pay
    pay_params = {
      body: "乐存好衣账户充值",
      out_trade_no: "trade-#{Time.now.to_i}",
      total_fee: wx_pay_params[:total_fee],
      spbill_create_ip: request.remote_ip,
      notify_url: wx_notify_cloud_closet_wechat_url,
      trade_type: 'JSAPI',
      openid: wx_pay_params[:openid]
    }
    logger.info "wxpay pay_params is:#{pay_params}"
    prepay_result = WxPay::Service.invoke_unifiedorder(pay_params), wx_pay_options
    logger.info "wx_pay prepay_result is:#{prepay_result}"
    if prepay_result.success?
      response = WxPay::Sign.generate_js_pay_req prepay_result, wx_pay_options
      logger.info "wx_pay response is:#{response}"
      render json: response
    else
      logger.error "Error: #{prepay_result['return_msg']}"
      render json: prepay_result
    end
  end

  def wx_notify
    result = Hash.from_xml(request.body.read)['xml']
    logger.info result.inspect
    if WxPay::Sign.verify?(result)
      render xml: { return_code: 'SUCCESS', return_msg: 'OK' }.to_xml(root: 'xml', dasherize: false)
    else
      render xml: { return_code: 'FAIL', return_msg: 'Signature Error' }.to_xml(root: 'xml', dasherize: false)
    end
  end

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  private

    def wx_pay_params
      params.permit(
        :openid, :total_fee
        )
    end
end
