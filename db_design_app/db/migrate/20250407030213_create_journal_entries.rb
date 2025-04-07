class CreateJournalEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :journal_entries do |t|
      t.references :client, index: true
      t.text :entry

      t.timestamps
    end
  end
end
