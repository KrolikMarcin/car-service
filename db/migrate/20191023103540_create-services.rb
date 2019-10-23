ROM::SQL.migration do
  change do
    create_table :services do
      primary_key :id

      column :start_date, DateTime, null: false
      column :end_date, DateTime, null: false
      column :price, String, null: false
      foreign_key :user_id, :users
    end
  end
end
