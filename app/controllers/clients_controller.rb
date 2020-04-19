class ClientsController < ActionController::Base
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all
    end
    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)

        if @client.save
            redirect_to client_path(@client.id)
        else
            render "new"
        end
    end

    def edit
    end
    
    def update
        if @client.update(client_params)
            redirect_to client_path(@client.id)
        else
            render "edit"
        end
    end

    def show
    end

    def destroy 
        @client.destroy!
        redirect_to clients_path
    end

   private

    def set_client
        @client = Client.find(params[:id])
    end

    def client_params
        params.require(:client).permit(:client_number, :first_name, :last_name)
    end
end