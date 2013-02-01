class PostsController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create
		@iterable = current_user.iterables.find(params[:iterable_id])
		@post = @iterable.posts.build(:post => params[:new_post])
		if @post.save
			flash[:success] = "Post created!"
			redirect_to iterable_path(@iterable)
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
	end
	
end
