Rails.application.routes.draw do
  root 'homes#top' #トップ画面をルートパスに設定
  resources :books
end
