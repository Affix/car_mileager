Rails.application.routes.draw do

  root 'mileages#index'

  resources :mileages

  post 'create'          => 'mileages#create'
  get 'list'             => 'mileages#list'
  get 'delete'           => 'mileages#delete'
  post 'settings/update' => 'settings#update'
  get 'monthly'          => 'mileages#monthly'
  get 'populate_graph'   => 'mileages#populate_graph'

end
