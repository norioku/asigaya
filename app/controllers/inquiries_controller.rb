class InquiriesController < ApplicationController

def new
    @inquiry = Inquiry.new
  	@user = current_user
end

def create
end

def complete
    @user = User.find(params[:id])
end

def admin_index
    
end

def admin_show
    
end

end