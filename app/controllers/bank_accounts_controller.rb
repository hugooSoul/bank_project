class BankAccountsController < ApplicationController

    before_action :set_bank_account, only: [:show, :edit, :update, :destroy]

    def index
        @bank_accounts = BankAccount.all
    end

    def new
        @bank_account = BankAccount.new
    end

    def create
        @bank_account = BankAccount.new(bank_account_params)

        if @bank_account.save
            redirect_to bank_account_path(@bank_account.id)
        else
            render "new"
        end
    end

    def edit
    end

    def update
        if @bank_account.update(bank_account_params)
            redirect_to bank_account_path(@bank_account.id)
        else
            render "edit"
        end
    end

    def show
    end

    def destroy
        client = @bank_account.client
        if @bank_account.balance > 0
            redirect_to bank_account_path(@bank_account.id)
        else
            @bank_account.destroy!
            redirect_to client_path(client)
        end
    end
    
    private

    def set_bank_account
        @bank_account = BankAccount.find(params[:id])
    end

    def bank_account_params
        params.require(:bank_account).permit(:account_number, :client_id)
    end
end