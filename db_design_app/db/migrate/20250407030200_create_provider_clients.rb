class CreateProviderClients < ActiveRecord::Migration[8.0]
  def change
    create_table :provider_clients do |t|
      t.references :client, index: true
      t.references :provider, index: true
      t.string :plan

      t.timestamps
    end

    add_index :provider_clients, [ :provider_id, :client_id ], unique: true
  end
end
