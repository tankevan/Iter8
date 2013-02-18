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
			flash[:success] = "Comment posted!"
			redirect_to iterable_path(@iterable)
			@iterable.touch
		else
			flash[:notice] = "Unable to post comment"
			redirect_to new_post_comment_path(@post)
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@comment = Comment.find(params[:comment_id])
		if @comment.destroy
			flash[:success] = "Comment deleted!"
		else
			flash[:notice] = "Unable to delete comment"
		end
		redirect_to iterable_path(params[:id])
	end
	
end
