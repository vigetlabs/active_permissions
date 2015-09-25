module ActivePermissions
  module Authorizations
    class PermissionAdapter < ActiveAdmin::AuthorizationAdapter

      def authorized?(action, subject = nil)
        # Not a typically registered AA Resource
        if subject.class == ActiveAdmin::Page
          if subject.name == "Permissions"
            return authorized?(:update, permission_model)
          else
            return true
          end
        end

        # if subject is a database resource,
        # we want to pass in it's model class instead
        if subject.class != Class
          subject = subject.class
        end

        permission_model.for(user: user,
          model: subject, action: action).allowed?
      end

      def permission_model
        ::ActivePermissions::Models::Permission
      end
    end
  end
end
