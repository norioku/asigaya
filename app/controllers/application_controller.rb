class ApplicationController < ActionController::Base
    
def after_sign_in_path_for(resource)
    case resource

	  when User
	    root_path
	  end
  end
end