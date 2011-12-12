class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :ler_noticias, :calendario, :ler_categorias_de_conteudo
  
  def ler_noticias
    @noticias = Update.order('created_at DESC').limit 3
  end
  
  def ler_categorias_de_conteudo
    @categorias_de_conteudo = StudyCategory.all
  end
  
  def calendario
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
  def slide
    width = params[:width] 
    width ||= 500
    height = params[:height] 
    height ||= width * 0.76953125
    url="http://www.slideshare.net/api/oembed/1?url=#{params[:url]}&format=json";
    images = Curl::Easy.perform(url)
#    images.on_body { |d| data = ActiveSupport::JSON.decode((d)) }
#    images.perform
   data = ActiveSupport::JSON.decode((images.body_str))
    num = data[:total_slides]
    suffix = data[:slide_image_baseurl_suffix]
    slides = data[:slide_image_baseurl]
    yay = (num && slides);
    render :layout => false, :locals => {
      :url => params[:url],
      :width => width,
      :height => height,
      :images => images,
      :data => data,
      :num => num,
      :suffix => suffix,
      :slides => slides,
      :yay => yay,
    }
  end
end
