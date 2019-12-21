class InquiriesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :admin?, only: [:admin_index,:admin_show,:update]

    def new
  	    @inquiry = Inquiry.new
  	    @user = current_user
    end

    def create
  	    @inquiry = Inquiry.new(inquiry_params)
  	    @inquiry.user_name = current_user.name
  	    @inquiry.email = current_user.email
        @user = User.find(params[:id])
        
  	    if @inquiry.save
            redirect_to user_inquiries_complete_path(@user)
        else
  	    render action: :new
  	    flash[:danger] = "入力内容に不備があります。"
        end
    end

    def complete
        @user = User.find(params[:id])
        ender = User.find(params[:id])
    end

    def admin_index
        @inquiries = Inquiry.all
    end

    def admin_show
        @inquiry = Inquiry.find(params[:id])
    end

    def update
        @inquiry = Inquiry.find(params[:id])
		    if @inquiry.update(inquiry_params)

			    flash[:success] = "送信されました。"
                @inquiry.update(status: "返信済")
			    InquiryMailer.send_mail(@inquiry).deliver_now
			    redirect_to admin_inquiry_index_path(@inquiry)
		    else
			    flash.now[:danger] = "未記入の箇所があります。"
			    render :admin_show
		    end
	 end

	private
	
	def admin?
	   if current_user.admin == false
	       redirect_to root_path
	   end
	end

	def inquiry_params
		params.require(:inquiry).permit(:email, :name, :subject, :content, :reply)
	end

    end