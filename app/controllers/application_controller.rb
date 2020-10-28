class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_users_path
    elsif resource.class == User
      root_path
    elsif resource.class == Store
      stores_root_path
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :user
      root_path
    elsif resource == :store
      new_store_session_path
    end
  end

  # devise ストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :genre, :mood, :private, :smoking, :phone_number, :postal_number, :address, :introduce, :gender, :age, :industry, :job, :image])
  end

end