Rails.application.routes.draw do

  resources :locations, only: [:index, :create] do
  	collection do
  		get 'cities'
  	end
  end

  root to: "locations#index"
end
