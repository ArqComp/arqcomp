::Refinery::Application.routes.draw do
  resources :projects, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :projects, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
