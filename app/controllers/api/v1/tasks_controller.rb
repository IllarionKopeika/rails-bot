class Api::V1::RestaurantsController < Api::V1::BaseController
  before action :set_task, only: [ :show ]

  def show
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
