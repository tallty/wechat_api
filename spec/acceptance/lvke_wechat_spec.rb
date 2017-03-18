require 'acceptance_helper'

resource "旅客微信关联API接口" do

  post "lvke_wechat/js_hash" do
    parameter :page_url, "需要签名的URL地址", required: true

    describe '用户获取js_hash成功' do
      let(:page_url) { "http://www.lvkeapp.com/" }

      example "用户获取js_hash成功" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end
  end

  post "lvke_wechat/web_access_token" do
    parameter :code, "交换获取的code", required: true

    describe "用户交换code" do
      let(:code) { "4578" }

      example "用户交互code失败" do
        do_request
        puts response_body
        expect(status).to eq(400)
      end
    end
  end
end