class WeatherMuseumsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder account: :weather_museum

  include ClientApiConcern

  # oWGeSuIVAUEBzrs7pVhtIGzA31O4
  on :text, with: 'open_id' do |request|
    request.reply.text(request.message_hash['FromUserName'])
  end
end
