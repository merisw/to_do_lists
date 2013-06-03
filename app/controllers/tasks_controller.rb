class TasksController < ApplicationController
  before_filter :find_list
  before_filter :find_task, :only => [:show, :edit, :update, :destroy]


  def show
  end


  def new
    @task = @list.tasks.build
  end

  def edit
  end

  def create
    @task = @list.tasks.build(params[:task])
    if @task.save
      flash[:notice] = "Task has been created."
      redirect_to [@list, @task]
    else
      flash[:alert] = "Task was not created."
      render action: "new"
    end
  end

  def update
    if @task.update_attributes(params[:task])
      flash[:notice] = 'Task was successfully updated.'
      redirect_to [@list, @task]
    else
      flash[:alert] = "Task was not updated."
      render action: "edit"
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to @list
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end

  def find_task
    @task = @list.tasks.find(params[:id])
  end
end
