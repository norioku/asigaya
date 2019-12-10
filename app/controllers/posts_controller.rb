class PostsController < ApplicationController
	def index
		@posts =Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to post_show_path(@post.id)
		else
			flash.now[:danger] = "投稿できませんでした。"
		    render :new
		end
	end
 
	def edit
		@post = Post.find(params[:id])
		if current_user != @post.user
			redirect_to post_show_path
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to post_show_path
		else
			flash.now[:danger] = "投稿を更新できませんでした。"
			render :edit
    	end
    end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "投稿が削除されました"
			redirect_to posts_path
		else
			render action: :show
		end
   end

	private
	  def post_params
	    params.require(:post).permit(:title, :content, :address, :tag_list, :image)
	  end
    
  #  def favorite_params
		# 	params.require(:).permit(:)
		# end
	
	def user_params
		params.require(:user).permit(:name, :image)
	end
	
	def tag_params
		params.require(:tag).permit(:tag)
	end
	
	# def image_params
	# 	params.require(:image).permit(:image_path)
	# end
end
	