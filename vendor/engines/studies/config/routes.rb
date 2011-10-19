::Refinery::Application.routes.draw do
  resources :studies, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :studies, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
