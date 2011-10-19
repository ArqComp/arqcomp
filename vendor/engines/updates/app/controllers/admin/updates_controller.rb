module Admin
  class UpdatesController < Admin::BaseController

    crudify :update, :xhr_paging => true

  end
end
