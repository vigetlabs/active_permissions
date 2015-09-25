ActiveAdmin.register_page "Permissions" do
  content :title => "Permissions" do
    render "form"
  end

  page_action :update, method: :put do
    params[:permission].each do |id, value|
      begin
        permission = ActivePermissions::Models::Permission.find(id)
        permission.update_attributes(allowed: value)
      rescue ActiveRecord::RecordNotFound
        # no-op
        # stahp messin' with params
      end
    end

    redirect_to admin_permissions_path
  end
end
