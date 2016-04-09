class ItemsController < ApplicationController


    before_filter :require_authentication, only: [:new, :edit, :create, :update, :destroy]
    before_filter :require_teacher_user, only: [:new, :edit, :create, :update, :destroy]
    @@project = nil;
    # GET /items
    # GET /items.json
    def index
        @items = Item.all
    end

    # GET /items/1
    # GET /items/1.json
    def show
        @item = Item.find(params[:id])
    end

    # GET /items/new
    def new
        @@project = Project.find(params[:project_id])
        @item = @@project.items.build
    end

    # GET /items/1/edit
    def edit
        @item = Item.find(params[:id])
    end

    # POST /items
    # POST /items.json
    def create
        @item = @@project.items.build(item_params)

        if @item.save
            redirect_to @item, notice: ('Item criado com sucesso')
        else
            render action: 'new'
        end

    end

    # PATCH/PUT /items/1
    # PATCH/PUT /items/1.json
    def update
        @item = @project.items.find(params[:id])


        if @item.update_attributes(params[:item])
            redirect_to @item, notice: ('Item criado com sucesso')
        else
            render action: 'edit'
        end

    end

    # DELETE /items/1
    # DELETE /items/1.json
    def destroy
        @@project = Project.find(params[:project_id])

        @item = @@project.items.find(params[:id])
        @item.destroy

        redirect_to projects_url
    end

    private


    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
        params.require(:item).permit(:name, :description, :price, :project_id)
    end

end
