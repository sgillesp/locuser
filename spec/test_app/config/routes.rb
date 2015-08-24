Rails.application.routes.draw do

  mount Locuser::Engine => "/locuser"

  scope module: 'locuser' do
    resources :locations
  end

  scope module: 'taxonomite' do
    resources :nodes
  end

end
