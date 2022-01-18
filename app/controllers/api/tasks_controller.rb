class Api::TasksController < Api::BaseController
  before_action :set_user
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    json_response(@user.tasks)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = @user.id
    
    if @task.save
      json_response(@task, :created)
    else
      json_response({ message: "Task not created" }, :unprocessable_entity)
    end
  end

  def show
    json_response(@task)
  end

  def update
    if @task.update(task_params)
      json_response(@task)
    else
      json_response({ message: "Failed to update task" }, :unprocessable_entity)
    end
  end

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
    params.require(:task).permit(:title, :description, :duedate, :tag, :completed, :user_id)
  end

  def set_task
    @task = current_user.tasks.find_by!(id: params[:id])
  end
end
