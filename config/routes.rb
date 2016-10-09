Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  resource :cloud_closet_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'wx_pay'
      post 'wx_notify'
    end
  end
  resource :lvke_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
