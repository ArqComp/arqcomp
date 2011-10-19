class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ler_noticias
  
  def ler_noticias
    @noticias = Update.order('created_at DESC').limit 3
  end
end
