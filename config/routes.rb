Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :trips, :drivers, :passengers

  patch '/drivers/:id/is_deactivated', to: 'drivers#is_deactivated', as:
    'mark_driver_deactivated'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
