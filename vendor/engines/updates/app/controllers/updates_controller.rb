class UpdatesController < ApplicationController

  before_filter :find_all_updates
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @update in the line below:
    present(@page)
  end

  def show
    @update = Update.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @update in the line below:
    present(@page)
  end

protected

  def find_all_updates
    @updates = Update.order('created_at DESC').paginate :page => params[:page], :per_page => 6
  end

  def find_page
    @page = Page.where(:link_url => "/updates").first
  end

end
