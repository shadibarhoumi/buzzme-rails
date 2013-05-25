class SchoolsController < ApplicationController
	def index
		@schools = School.all
	end

	def show
		@school = School.find(params[:id])
	end

	def new
		@school = School.new
	end

	def create
		@school = School.new(params[:school])
		if @school.save
			redirect_to @school
		else
			render :new
		end
	end

	def update
		@school = School.find(params[:id])
		# if target is in school, pull out id, otherwise create target in school and return id
		# also strip whitespace from name in-place 	
		target_id = @school.targets.where(name: params[:school][:targets_attributes]["0"][:name].strip_or_self!).first_or_create.id
		# add id to first targets_attributes element
		params[:school][:targets_attributes]["0"][:id] = target_id
		# update as usual using either brand new or found target, along with new message
		if @school.update_attributes(params[:school])
			redirect_to @school
		else
			render :show
		end
	end
end
