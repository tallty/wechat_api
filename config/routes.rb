Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  resource :cloud_closet_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'wx_pay'
      post 'wx_notify'
      post 'template_message'
      get 'user_wechat_info'
    end
  end
  resource :lvke_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
    end
  end

  resource :smart_life_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :dt_edu_wechat, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :stiei_job, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :print, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
      get 'web_userinfo'
    end
  end

  resource :print_offical, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
      get 'web_userinfo'
    end
  end

  resource :cpic_weather, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
      get 'web_userinfo'
    end
  end

  resource :innovation_center, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :weather_museum, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :chen_test, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      post 'template_message'
      get 'user_wechat_info'
    end
  end

  resource :africa_pay, only: [:show, :create] do
    member do
      post 'js_hash'
      post 'web_access_token'
      # post 'template_message'
      get 'user_wechat_info'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
