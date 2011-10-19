module NavigationHelpers
  module Refinery
    module Studies
      def path_to(page_name)
        case page_name
        when /the list of studies/
          admin_studies_path

         when /the new study form/
          new_admin_study_path
        else
          nil
        end
      end
    end
  end
end
