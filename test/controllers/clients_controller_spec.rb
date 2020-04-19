require "rails_helper"

RSpec.describe ClientsController, type: :controller do
    subject { ClientsController.new }
    let(:clients) { create :clients }

    describe "index" do
        it "displey all the registered clients" do
        expect(Client.all).to match_array(clients)
        end
    end  
end