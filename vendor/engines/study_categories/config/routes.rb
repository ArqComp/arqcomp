::Refinery::Application.routes.draw do
  get '/studies/category/:id' => "study_categories#show", :as => :study_category
#  resources :study_categories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :study_categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
