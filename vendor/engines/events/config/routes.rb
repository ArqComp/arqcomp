::Refinery::Application.routes.draw do
#  match '/events(/:year(/:month))' =>'events#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
   get '/events/:dia/:mes/:ano' =>'events#show', :as => :day, :constraints => {:ano => /\d{4}/, :mes => /\d{1,2}/, :dia => /\d{1,2}/} 
#  resources :events, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :events, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
