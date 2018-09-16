class CpicWeathersController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder account: :cpic_weather

  include ClientApiConcern

  # on :text do |request, content|
  #   request.reply.text "echo: #{content}" # Just echo
  # end
end

