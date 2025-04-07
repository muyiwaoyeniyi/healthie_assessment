# == Schema Information
#
# Table name: provider_clients
#
#  id          :integer          not null, primary key
#  client_id   :integer
#  provider_id :integer
#  plan        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_provider_clients_on_client_id                  (client_id)
#  index_provider_clients_on_provider_id                (provider_id)
#  index_provider_clients_on_provider_id_and_client_id  (provider_id,client_id) UNIQUE
#

class ProviderClient < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  validates :provider, uniqueness: { scope: :client }
  validates :plan, inclusion: { in: %w[basic premium] }, presence: true
end
