module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'name', :xhr_paging => true

  end
end
