Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :group_events, only: [:show, :index]
    end
  end

  namespace :admin do
    resources :group_events
  end

  root to: "admin/group_events#index"
end
