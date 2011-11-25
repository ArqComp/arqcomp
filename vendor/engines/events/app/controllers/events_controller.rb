class EventsController < ApplicationController

  before_filter :find_all_events
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    
    present(@page)
  end

  def show
    @date = "#{params[:dia]}/#{params[:mes]}/#{params[:ano]}".to_datetime
    
    @day_events = Event.find(:all, :conditions => ["start_at < ? AND end_at >= ?", @date + 1.day, @date])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

protected

  def find_all_events
    @events = Event.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/events").first
  end

end
