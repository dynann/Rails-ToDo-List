class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  #get method all the tasks with index.html.erb
  def index 
    @tasks = Task.all
  end

  #get method this method get user to the create but does not save to database
  def new
    @task = Task.new
    @categories = Category.all
  end

  #get method will retrieve the list with the specified id but update method will render this to perform crud operation 
  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end

  #post method this allow user to create new list with presentation view new.html.erb
  def create
    @task = Task.new(task_params)
    @categories = Category.all
    if @task.save
      redirect_to task_path(@task), notice: "Task successfully created."
      # format.html { redirect_to @task, notice: "Task was successfully created." }
    else
      render :new
    end
  end

  #get method retrieve the list with specified id with presention show.html.erb
  def show
    @task = Task.find(params[:id])
  end

  #put or patch method allow u to update with method edit
  def update
    @task = Task.find(params[:id])
    @categories = Category.all
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task successfully updated."
    else
      render :edit
    end
  end

  #delete method allow u to delete method after getting the list from specified id fyi : from function show
  def destroy
    @task.destroy!
    redirect_to tasks_path, notice: "Task successfully deleted."
    # redirect_to tasks_path, notice: "Task successfully deleted."
    # format.html{redirect_to task_path, notice: "Task Successfully deleted"}
  end



  private
  def set_task
    @task = Task.find(params[:id])
  end

  #allow only which parameteres are accessible 
  def task_params
    params.require(:task).permit(:name, :category_id, :is_completed)
  end
end
