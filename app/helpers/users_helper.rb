module UsersHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.find(params[:id])
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
