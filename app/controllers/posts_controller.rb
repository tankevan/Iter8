class PostsController < ApplicationController

	def index
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
	end

	def create
		@iterable = current_user.iterables.find(params[:iterable_id])
		@iterable.posts.create!(:post => params[:post][:post], :user_id => current_user.id)
		@post = @iterable.posts.find_all_by_post(params[:post][:post]).last
		respond_to do |format|
			format.html { flash[:success] = "Post created!"
						  redirect_to iterable_path(@iterable)
						  @iterable.touch }
			format.js
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:success] = "Post deleted!"
		else
			flash[:notice] = "Unable to delete post"
		end
		redirect_to iterable_path(@post.iterable_id)
	end
	
end
