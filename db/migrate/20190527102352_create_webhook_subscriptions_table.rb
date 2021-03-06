class CreateWebhookSubscriptionsTable < DbMigrationConnection
  def up
    run_migration_for_db(DbConnection::KitSaasSubenv) do
      create_table :webhook_subscriptions do |t|
        t.column :client_id, :integer, null: false
        t.column :webhook_topic_kind, :tinyint, limit: 1, null: false
        t.column :webhook_endpoint_uuid, :string, limit: 40, null: false
        t.column :status, :tinyint, null: false, limit: 1
        t.timestamps
      end

      add_index :webhook_subscriptions, [:client_id, :webhook_topic_kind ,:webhook_endpoint_uuid], name: 'uk_1', unique: true
      add_index :webhook_subscriptions, [:webhook_endpoint_uuid], name: 'i_1', unique: false
    end

  end

  def down
    run_migration_for_db(DbConnection::KitSaasSubenv) do
      drop_table :webhook_subscriptions if DbConnection::KitSaasSubenv.connection.table_exists? :webhook_subscriptions
    end
  end

end
