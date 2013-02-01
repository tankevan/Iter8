class CommentsController < ApplicationController

	def index
	end

	def show
	end

	def new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(:comment => params[:new_comment])
		@iterable = current_user.iterables.find(@post.iterable_id)
		if @comment.save
			redirect_to iterable_path(@iterable)
		else
			redirect_to new_post_comment_path(@post)
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end
	
end
