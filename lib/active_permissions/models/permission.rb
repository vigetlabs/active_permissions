module ActivePermissions
  module Models
    class Permission < ActiveRecord::Base
      ALL_ACTIONS = %w(read create update destroy)

      belongs_to :admin_user

      validates :admin_user, :model, :action, presence: true
      validates :action, inclusion: {in: ALL_ACTIONS}

      class << self
        def to_s
          "Permissions"
        end

        def active_resources(active_admin_namespace)
          @active_resources ||= {}

          @active_resources[active_admin_namespace.name] ||= begin
            active_admin_namespace.resources.select do |resource|
              resource.include_in_menu? && resource.is_a?(ActiveAdmin::Resource)
            end.map(&:resource_class) + [self]
          end
        end

        def for(user:, model:, action:)
          @cache ||= {}

          @cache["#{user}-#{model}-#{action}"] ||= if model.in? ActiveRecord::Base.descendants
            where(admin_user: user, model: model, action: action).first_or_create
          else
            new
          end
        end

        def actions_for(model_class)
          if model_class == self
            %w(update)
          else
            ALL_ACTIONS
          end
        end
      end


      def disabled_for?(user)
        admin_user == user && model == self.class.name
      end
    end
  end
end
