class ProjectsController < ApplicationController

    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_filter :require_authentication, only: [:new, :edit, :create, :update, :destroy]
    before_filter :require_teacher_user, only: [:new, :edit, :create, :update, :destroy]


    # GET /projects
    # GET /projects.json
    def index
        @projects = Project.most_recent
    end

    # GET /projects/1
    # GET /projects/1.json
    def show
         @project = Project.find(params[:id])
    end

    # GET /projects/new
    def new
        @project = current_user.projects.build
    end

    # GET /projects/1/edit
    def edit
        @project = current_user.projects.find(params[:id])
    end

    # POST /projects
    # POST /projects.json
    def create
        @project = current_user.projects.build(project_params)

        if @project.save
            redirect_to @project, notice: ('Quarto criado com sucesso')
        else
            render action: 'new'
        end
    end

    # PATCH/PUT /projects/1
    # PATCH/PUT /projects/1.json
    def update
        @project = current_user.projects.find(params[:id])

        respond_to do |format|
            if @project.update(project_params)
                format.html { redirect_to @project, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @project }
            else
                format.html { render :edit }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /projects/1
    # DELETE /projects/1.json
    def destroy
        @project = current_user.projects.find(params[:id])
        @project.destroy

        redirect_to projects_url
    end

    def my_projects

        @projects = Array(current_user.projects)

    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
        params.require(:project).permit(:name, :project_type, :description)
    end
end
