class PostsController < ApplicationController
	
	
	before_action :authenticate_user!, only: [:favorite,:new,:show,:create,:edit,:update,:destroy]
	def index
		@posts = if params[:tag].present?
				    Post.tagged_with(params[:tag]).page(params[:page]).per(4)
		         else
		         	Post.all.page(params[:page]).per(4)
		         end
		@users = User.all    
		@tags = ActsAsTaggableOn::Tag.includes(:taggings).where("taggings_count > 0")
	end
	
	def favorite
		@posts = if params[:tag].present?
				    Post.tagged_with(params[:tag]).page(params[:page]).per(4)
		         else
		         	Post.all.page(params[:page]).per(4)
		         end
		@users = User.all    
		@tags = ActsAsTaggableOn::Tag.includes(:taggings).where("taggings_count > 0")
		@array = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
		@all_ranks = Kaminari.paginate_array(@array).page(params[:page]).per(4)
	
	end

	def show
		@post = Post.find(params[:id])
		@user = @post.user
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
			render action: :edit
		end
    end

	private
		
	def post_params
	    params.require(:post).permit(:title, :content, :address, :tag_list, :image, :location)
	end
	
	def user_params
		params.require(:user).permit(:name, :image)
	end
	
	def tag_params
		params.require(:tag).permit(:tag, :name)
	end
end
