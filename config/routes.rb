Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/accounts/count', to: 'accounts#count'
  get '/big-waves', to: 'waves#big_waves'
end
