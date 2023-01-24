class ApplicationController < ActionController::Base
 #before_action :authenticate_user!
 protect_from_forgery except: :index
 def after_sign_in_path_for(resourse)
 	rooms_path
 end
end
