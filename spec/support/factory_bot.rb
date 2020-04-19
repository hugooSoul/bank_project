RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end


FactoryBot.define do  
    factory :clients do
      first_name 'Hugo'
      last_name 'Mandujano'
    end
end