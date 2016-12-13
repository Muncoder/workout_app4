class ExercisesController < ApplicationController

	before_action :find_exercise, except: [:index, :new, :create]

	def index
		@exercises = Exercise.all.order("created_at DESC")
	end

	def new
		@exercise = Exercise.new
	end

	def create
		@exercise = Exercise.create(exercise_params)

		if @exercise.save
			flash[:notice] = "Saved successfully"
			redirect_to exercises_path
		else
			flash[:notice] = "Could not be saved"
			render "new"
		end
	end

	def show
	end

	def edit

	end

	def update
		if @exercise.update(exercise_params)
			flash[:notice] = "Updated successfully"
			redirect_to @exercise
		else
			flash[:notice] = "Could not be updated"
			render "edit"
		end
	end

	def destroy
	end

	private

		def exercise_params
			params.require(:exercise).permit(:duration, :details, :workout_date)
		end

		def find_exercise
			@exercise = Exercise.find(params[:id])
		end

end