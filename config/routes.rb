Rails.application.routes.draw do
  get 'passengers/index'

  get 'passengers/show'

  get 'passengers/new'

  get 'passengers/create'

  get 'passengers/edit'

  get 'passengers/update'

  get 'passengers/destroy'

  get 'drivers/index'

  get 'drivers/show'

  get 'drivers/new'

  get 'drivers/create'

  get 'drivers/edit'

  get 'drivers/update'

  get 'drivers/destroy'

  get 'trips/index'

  get 'trips/show'

  get 'trips/new'

  get 'trips/create'

  get 'trips/edit'

  get 'trips/update'

  get 'trips/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
