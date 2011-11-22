::Refinery::Application.routes.draw do
  resources :study_categories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :study_categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
