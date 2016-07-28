class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_workout_id, only: [:show]


	def index
		@workouts = current_user.workouts.last_7_days
	end

	def show
		
	end

	def new
		@workout = current_user.workouts.new
	end

	def create
		@workout = current_user.workouts.new(workout_params)
		
		if @workout.save
			redirect_to user_workout_path(@workout.user_id, @workout.id), notice: 'Workout has been created'
		else
			flash.now[:error] = 'Workout has not been created'
			render :new
		end
	end

	private
		def workout_params
			params.require(:workout).permit(:duration, :workout_details, :activity_date, :user_id)
		end

		def set_workout_id
			@workout = current_user.workouts.find(params[:id])
		end

end
