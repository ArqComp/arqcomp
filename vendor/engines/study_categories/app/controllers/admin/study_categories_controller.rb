module Admin
  class StudyCategoriesController < Admin::BaseController

    crudify :study_category,
            :title_attribute => 'name', :xhr_paging => true

  end
end
