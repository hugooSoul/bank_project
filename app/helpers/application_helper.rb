module ApplicationHelper

    def number_of_clients
        Client.count
    end
end
