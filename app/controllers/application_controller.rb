class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ler_noticias, :calendario
  
  def ler_noticias
    @noticias = Update.order('created_at DESC').limit 3
  end
  
  def calendario
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
end
