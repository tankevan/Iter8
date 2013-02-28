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
						  redirect_to iterable_path(@iterable) }
			format.js
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@post = Post.find(params[:id]).destroy
		respond_to do |format|
			format.html { flash[:success] = "Post deleted!"
						  redirect_to iterable_path(@post.iterable_id) }
			format.js
		end
	end
	
end
