class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ler_noticias
  
  def ler_noticias
    @noticias = Update.all
  end
end
