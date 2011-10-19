module NavigationHelpers
  module Refinery
    module Updates
      def path_to(page_name)
        case page_name
        when /the list of updates/
          admin_updates_path

         when /the new update form/
          new_admin_update_path
        else
          nil
        end
      end
    end
  end
end
