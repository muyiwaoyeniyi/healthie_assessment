  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #     MovieGenre.find_or_create_by!(name: genre_name)
  #   end


  # ActiveRecord::Base.transaction do
  provider_1 = Provider.create!(name: 'Provider 1', email: 'provider1@healthie.com')
  provider_2 = Provider.create!(name: 'Provider 2', email: 'provider2@healthie.com')

  client_1 = Client.create!(name: 'Client 1', email: 'client1@healthie.com')
  client_2 = Client.create!(name: 'Client 2', email: 'client2@healthie.com')
  client_3 = Client.create!(name: 'Client 3', email: 'client3@healthie.com')
  client_4 = Client.create!(name: 'Client 4', email: 'client4@healthie.com')

  ProviderClient.create!(provider: provider_1, client: client_1, plan: 'basic')
  ProviderClient.create!(provider: provider_1, client: client_2, plan: 'premium')
  ProviderClient.create!(provider: provider_2, client: client_1, plan: 'premium')
  ProviderClient.create!(provider: provider_2, client: client_2, plan: 'basic')
  ProviderClient.create!(provider: provider_2, client: client_3, plan: 'basic')
  ProviderClient.create!(provider: provider_2, client: client_4, plan: 'premium')
# end

JournalEntry.create!(client: client_1, entry: 'Client 1 First entry')
JournalEntry.create!(client: client_1, entry: 'Client 1 Second entry')
JournalEntry.create!(client: client_1, entry: 'Client 1 Third entry')
JournalEntry.create!(client: client_2, entry: 'Client 2 First entry')
JournalEntry.create!(client: client_2, entry: 'Client 2 Second entry')
JournalEntry.create!(client: client_3, entry: 'Client 3 First entry')
JournalEntry.create!(client: client_4, entry: 'Client 4 First entry')
JournalEntry.create!(client: client_4, entry: 'Client 4 Second entry')
