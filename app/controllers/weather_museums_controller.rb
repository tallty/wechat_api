class WeatherMuseumsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder appid: ENV["weather_museum_app_id"], secret: ENV["weather_museum_app_secret"], token: ENV["weather_museum_app_token"],
      access_token: Rails.root.join(ENV["weather_museum_app_access_token"]), jsapi_ticket: Rails.root.join(ENV["weather_museum_app_jsapi_ticket"])

  include ClientApiConcern

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end
