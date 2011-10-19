class ProjectsController < ApplicationController

  before_filter :find_all_projects
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @project in the line below:
    present(@page)
  end

  def show
    @project = Project.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @project in the line below:
    present(@page)
  end

protected

  def find_all_projects
    @projects = Project.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/projects").first
  end

end
