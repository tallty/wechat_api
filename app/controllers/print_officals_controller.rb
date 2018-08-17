class PrintOfficalsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-self-dsl
  wechat_responder account: :print_offical

  include ClientApiConcern

  # def create
  #   Rails.logger.info 'request.body'
  #   Rails.logger.info request.body.read
  #   super
  # end
  
  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end
end
