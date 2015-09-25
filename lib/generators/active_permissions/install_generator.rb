require 'rails/generators'
require 'rails/generators/active_record'

module ActivePermissions
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def install_migrations
      migration_template 'migrations/create_permissions.rb', 'db/migrate/create_permissions.rb'
    end

    def install_admin_resources
      copy_file 'active_admin_resources/permissions.rb', 'app/admin/permissions.rb'
    end

    def install_admin_views
      copy_file 'active_admin_views/_form.html.erb', 'app/views/admin/permissions/_form.html.erb'
    end

    def update_active_admin_config
      gsub_file("config/initializers/active_admin.rb", /.+config.authorization_adapter.+/) do |match|
        "  config.authorization_adapter = ActivePermissions::Authorizations::PermissionAdapter"
      end
    end
  end
end
