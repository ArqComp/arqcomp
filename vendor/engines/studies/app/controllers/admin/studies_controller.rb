module Admin
  class StudiesController < Admin::BaseController

    crudify :study, :xhr_paging => true

  end
end
