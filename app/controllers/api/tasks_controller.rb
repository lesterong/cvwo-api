class Api::TasksController < Api::BaseController
  before_action :set_user
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    json_response(@user.tasks)
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = @user.id
    json_response(@task, :created) if @task.save
  end

  # GET /tasks/:id
  def show
    json_response(@task)
  end

  # PUT /tasks/:id
  def update
    @task.update(task_params)
    head :no_content
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private
  def set_user
    @user = current_user
  end

  def task_params
    params.permit(:title, :description, :duedate, :tag, :completed, :user_id)
  end

  def set_task
    @task = current_user.tasks.find_by!(id: params[:id])
  end
end
