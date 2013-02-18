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
		@post = @iterable.posts.build(:post => params[:new_post])
		if @post.save
			flash[:success] = "Post created!"
			redirect_to iterable_path(@iterable)
			@iterable.touch
		else
			flash[:notice] = "Could not create post"
			redirect_to new_post_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@post = Post.find(params[:post_id])
		if @post.destroy
			flash[:success] = "Post deleted!"
		else
			flash[:notice] = "Unable to delete post"
		end
		redirect_to iterable_path(params[:id])
	end
	
end
