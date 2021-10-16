class TasksController < ApplicationController

    before_action :set_project
    before_action :set_task, except: [:create]

    def create
        @task = @project.tasks.create(task_params)
        redirect_to @project 
    end

    def destroy
        if @task.destroy
          flash[:success] = "Task deleted Successfully!"
        else
          flash[:error] = "Task deletion Failed!"
        end
        redirect_to @project
    end

    def complete
        @task.update_attribute(:completed_at, Time.now)
        redirect_to @project, notice: "Task Completed!"
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_task
        @task = @project.tasks.find(params[:id])
    end

    def task_params
        params[:task].permit(:content)
    end
end
