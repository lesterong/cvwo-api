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
    
    if @task.save
      json_response(@task, :created)
    else
      json_response({ error: "Task not created" }, :unprocessable_entity)
    end
  end

  # GET /tasks/:id
  def show
    json_response(@task)
  end

  # PUT /tasks/:id
  def update
    if @task.update(task_params)
      json_response({ message: "Successfully updated task" }, :ok)
    else
      json_response({ message: "Failed to update task" }, :unprocessable_entity)
    end
  end

  # DELETE /tasks/:id
  def destroy
    if @task.destroy
      head :no_content
    else
      json_response({ message: "Failed to delete task" }, :unprocessable_entity)
    end
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
