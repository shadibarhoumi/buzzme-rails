class TargetsController < ApplicationController
	def show
		@target = Target.find(params[:id])
	end

	# TODO: implement view in views/targets/show.html.erb
	def update
		@target = Target.find(params[:id])
		if @target.update_attributes(params[:target])
			redirect_to @target
		else
			# make sure to render errors in view
			render :show
		end
	end

end
