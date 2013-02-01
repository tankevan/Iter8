class IterablesController < ApplicationController

	def index
		@iterables = current_user.iterables.all

	end

	def show
		@iterable = current_user.iterables.find(params[:id])
		@posts = @iterable.posts.all
	end

	def new
	end

	def create
		@iterable = current_user.iterables.build(:name => params[:new_iterable])
		if @iterable.save
			flash[:success] = "Iterable created!"
			redirect_to iterables_path
		else
			flash[:notice] = "Could not create iterable"
			redirect_to new_iterable_path
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
