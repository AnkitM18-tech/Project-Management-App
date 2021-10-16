class TasksController < ApplicationController

    before_action :set_project

    def create
        @task = @project.tasks.create(task_params)
        redirect_to @project 
    end

    def destroy
        @task = @project.tasks.find(params[:id])
        if @task.destroy
          flash[:success] = "Task deleted Successfully!"
        else
          flash[:error] = "Task deletion Failed!"
        end
        redirect_to @project
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def task_params
        params[:task].permit(:content)
    end
end
