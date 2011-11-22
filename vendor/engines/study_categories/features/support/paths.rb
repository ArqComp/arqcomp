module NavigationHelpers
  module Refinery
    module StudyCategories
      def path_to(page_name)
        case page_name
        when /the list of study_categories/
          admin_study_categories_path

         when /the new study_category form/
          new_admin_study_category_path
        else
          nil
        end
      end
    end
  end
end
