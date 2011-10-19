module NavigationHelpers
  module Refinery
    module Projects
      def path_to(page_name)
        case page_name
        when /the list of projects/
          admin_projects_path

         when /the new project form/
          new_admin_project_path
        else
          nil
        end
      end
    end
  end
end
