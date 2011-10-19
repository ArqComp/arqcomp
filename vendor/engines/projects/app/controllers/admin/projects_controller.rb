module Admin
  class ProjectsController < Admin::BaseController

    crudify :project, :xhr_paging => true

  end
end
