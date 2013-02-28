class IterablesController < ApplicationController

	def index
		@iterables = current_user.iterables.order("position")
	end

	def show
		@iterable = current_user.iterables.find(params[:id])
		@users = @iterable.users.all
		@posts = @iterable.posts.find(:all, :order => "created_at DESC")
		@post = @iterable.posts.new
	end

	def new
		@iterable = current_user.iterables.new
	end

	def create
		if current_user.iterables.create!(:name => params[:iterable][:name], :position => current_user.iterables.last.position + 1, :is_header => params[:iterable][:is_header])
			flash[:success] = "Iterable created!"
			redirect_to iterables_path
		else
			flash[:notice] = "Could not create iterable"
			redirect_to new_iterable_path
		end
	end

	def edit
		@iterable = current_user.iterables.find(params[:id])
	end

	def update
		@iterable = current_user.iterables.find(params[:id])
		if @iterable.update_attributes(params[:iterable])
			flash[:success] = "Iterable name updated!"
			redirect_to iterables_path
		else
			flash[:notice] = "Could not update iterable name"
			redirect_to edit_iterable_path(@iterable)
		end
	end

	def destroy
		@iterable = Iterable.find(params[:id]).destroy
		respond_to do |format|
			format.html {flash[:success] = "Iterable deleted!"
						 redirect_to iterables_path}
			format.js
		end
	end

	def sort
		params[:iterable].each_with_index do |id, index|
			Iterable.update_all({position: index+1}, {id: id})
		end
		render nothing: true
	end

end
