class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [ :show, :create ]
  before action :set_task, only: [ :show ]

  def show
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    if @task.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:task, :description, :manager, :employee, :email, :start_time, :end_time)
  end

  def render_error
    render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
  end
end
