class StudiesController < ApplicationController

  before_filter :find_all_studies
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @study in the line below:
    present(@page)
  end

  def show
    @study = Study.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @study in the line below:
    present(@page)
  end

protected

  def find_all_studies
    @studies = Study.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/studies").first
  end

end
