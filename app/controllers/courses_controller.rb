class CoursesController < ApplicationController
  
	# GET /data_import.json
    def index
		@courses = Course.all
		render json: @courses, methods: [:subject, :field]
	end

	# File upload
	def create
		@course = Course.new(course_params)
		@course.category = category_params.has_key?(:field_id) && category_params[:field_id] != nil ? Field.find(category_params[:field_id]) : Subject.find(category_params[:subject_id])
		if @course.save
	      	render json: {success: true}
	    else
	      	render json: @course.errors, status: :unprocessable_entity
	    end  
	end

	def show
    	@course = Course.find(params[:id])
    	render json: @course, methods: [:category, :users_info]
  	end

	def update
		@course = Course.find(course_params[:id])
		@course.category = category_params.has_key?(:field_id) && category_params[:field_id] != nil ? Field.find(category_params[:field_id]) : Subject.find(category_params[:subject_id])
		if @course.update(course_params)
	      	render json: {success: true}
	    else
	      	render json: @course.errors, status: :unprocessable_entity
	    end 
	end

	def destroy
		Course.find(params[:id]).destroy
		render json: {success: true}
	end

	def search_users
		@users = User.joins(:courses).where("role_id = :role_id AND courses.id != :course_id AND (first_name LIKE :search_string OR last_name LIKE :search_string OR email LIKE :search_string)", {role_id: search_user_params[:role_id], course_id: search_user_params[:id], search_string: "%#{search_user_params[:search_string]}%"})
		render json: @users, methods: [:avatar_url_thumb]
	end

	def remove_participant
		@course = Course.find(params[:id])
		@course.users.delete_if {|user| user.id != params[:user_id]}
		if @course.update
	      	render json: {success: true}
	    else
	      	render json: @course.errors, status: :unprocessable_entity
	    end 
	end

	private 

	    def course_params
	    	params.require(:course).permit(:id, :name, :description)
	    end

	    def category_params
	    	params.permit(:subject_id, :field_id)
	    end

	    def search_user_params
	    	params.permit(:id, :role_id, :search_string)
	    end

end