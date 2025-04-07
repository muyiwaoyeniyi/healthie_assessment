# == Schema Information
#
# Table name: journal_entries
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_journal_entries_on_client_id  (client_id)
#

class JournalEntry < ApplicationRecord
  belongs_to :client

  validates :entry, presence: true
end
