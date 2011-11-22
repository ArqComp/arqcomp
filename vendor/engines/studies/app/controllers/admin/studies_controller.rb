module Admin
  class StudiesController < Admin::BaseController

    crudify :study, :xhr_paging => true

    before_filter :categorias
    
    def categorias
      @categorias = StudyCategory.all.collect do |category|
        [category.name, category.id]
      end
    end
    
  end
end
