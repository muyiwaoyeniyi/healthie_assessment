# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Provider < ApplicationRecord
  has_many :provider_clients, dependent: :delete_all
  has_many :clients, through: :provider_clients

  validates :name, :email, presence: true

  # 1.
  # same as .clients on a provider instance
  def clients_by_provider_id
    Client.find_by_sql(
      [ "SELECT c.* from clients c
        inner join provider_clients pc
        on c.id = pc.client_id
        where pc.provider_id = ?", self.id ]
    )
  end

  # 4.
  def journal_entries_by_provider_id
    JournalEntry.find_by_sql([
      "SELECT * from journal_entries je
      inner join provider_clients pc
      on pc.client_id = je.client_id
      where pc.provider_id = ? order by je.created_at desc", self.id ])
  end
end
