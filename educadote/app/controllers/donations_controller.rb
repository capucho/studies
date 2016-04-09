class DonationsController < ApplicationController


    before_filter :require_authentication, only: [:new, :edit, :create, :update, :destroy]

    @@project = nil;
    # GET /donations
    # GET /donations.json
    def index
        @donations = Donations.all
    end

    # GET /donations/1
    # GET /donations/1.json
    def show
        @donation = Donation.find(params[:id])
    end

    # GET /donations/new
    def new
        @@project = Project.find(params[:project_id])
        @donation = @@project.donations.build

        logger.info { "Donation ID: " + @donation.project_id.to_s }
        logger.info { "User ID: " + @donation.user_id.to_s}
    end

    # GET /donations/1/edit
    def edit
        @donation = Donation.find(params[:id])
    end

    # POST /donations
    # POST /donations.json
    def create
        @donation = @@project.donations.build(donation_params)
        @donation.user_id = current_user.id
        if @donation.save
            redirect_to projects_path, notice: ('Doacao criada com sucesso')
        else
            render action: 'new'
        end

    end

    # PATCH/PUT /donations/1
    # PATCH/PUT /donations/1.json
    def update
        @donation = @project.donations.find(params[:id])


        if @donation.update_attributes(params[:donation])
            redirect_to @donation, notice: ('Doacao criada com sucesso')
        else
            render action: 'edit'
        end

    end

    # DELETE /donations/1
    # DELETE /donations/1.json
    def destroy
        @donation = @project.donations.find(params[:id])
        @donation.destroy

        redirect_to donations_url
    end

    private


    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
        params.require(:donation).permit(:value, :project_id, :user_id)
    end

end
