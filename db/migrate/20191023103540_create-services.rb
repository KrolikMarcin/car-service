ROM::SQL.migration do
  change do
    create_table :services do
      primary_key :id

      column :start_date, DateTime, null: false
      column :end_date, DateTime
      column :price, Integer
      foreign_key :user_id, :cars
    end
  end
end
