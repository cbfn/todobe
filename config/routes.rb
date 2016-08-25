Rails.application.routes.draw do

  # constraints subdomain: 'api' do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :todos
    end
  end
    # scope module: 'api' do
    #   namespace :v1 do
    #     resources :todos
    #   end
    # end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
