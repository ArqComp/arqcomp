class StudyCategoriesController < ApplicationController

  before_filter :find_all_study_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @study_category in the line below:
    present(@page)
  end

  def show
    @study_category = StudyCategory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @study_category in the line below:
    present(@page)
  end

protected

  def find_all_study_categories
    @study_categories = StudyCategory.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/study_categories").first
  end

end
