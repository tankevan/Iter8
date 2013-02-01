class PagesController < ApplicationController

	def landing
		if user_signed_in?
			redirect_to iterables_path
		end
	end

end
