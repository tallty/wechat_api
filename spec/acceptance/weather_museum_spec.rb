require 'acceptance_helper'

resource "气象博物馆微信关联API接口" do

  post "weather_museum/js_hash" do
    parameter :page_url, "需要签名的URL地址", required: true

    describe '用户获取js_hash' do
      let(:page_url) { "http://closet.tallty.com/" }

      example "用户获取js_hash成功" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end
  end

  post "weather_museum/web_access_token" do
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

  get "weather_museum/user_wechat_info" do
    parameter :openid, "微信用户的openid", required: true

    describe '用户获取微信用户的信息' do

      context "获取用户微信信息成功" do
        let(:openid) { "olclvwJkArSK015Z9nhejX9sH60A" }
        example "获取用户微信信息成功" do
          do_request
          puts response_body
          expect(status).to eq 200
        end
      end

      context "获取用户信息失败" do
        let(:openid) { "123" }  
        example "获取用户微信信息失败（openid不存在）" do
          do_request
          puts response_body
          expect(status).to eq(400)
        end
      end
      
    end


  end
end