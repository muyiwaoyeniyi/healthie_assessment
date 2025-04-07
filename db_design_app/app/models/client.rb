# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord
  has_many :provider_clients, dependent: :delete_all
  has_many :providers, through: :provider_clients
  has_many :journal_entries, dependent: :delete_all

  validates :name, :email, presence: true

  # 2.
  # same as .providers on a provider instance
  def providers_by_client_id
    Provider.find_by_sql(
      [ "SELECT p.* from providers p
        inner join provider_clients pc
        on p.id = pc.provider_id
        where pc.client_id = ?", self.id ]
    )
  end

  # 3.
  # .journal_entries
  def journal_entries_by_client_id
    JournalEntry.find_by_sql([ "SELECT * from journal_entries where client_id = ? order by created_at desc", self.id ])
  end
end
