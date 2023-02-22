class ApplicationController < ActionController::Base
 #before_action :authenticate_user!
 protect_from_forgery except: :index
 def after_sign_in_path_for(resourse)
    #session[:user_id] = resource.id
    $session = resourse.id
    if resource.class.name == "AdminUser"
      admin_dashboard_path
    elsif resourse.class.name == "User"
 	    rooms_path
    end
 end
end
