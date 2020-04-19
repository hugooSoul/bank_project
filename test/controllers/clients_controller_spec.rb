require "rails_helper"

RSpec.describe ClientsController, type: :controller do
    describe "index" do
        it "display all the registered clients" do
            hugo = FactoryBot.create(:clients, first_name: 'Hugo', last_name: 'Mandujano')
            expect(assigns(:clients)).to match_array([hugo])
        end
    end  
end