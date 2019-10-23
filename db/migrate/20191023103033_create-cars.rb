ROM::SQL.migration do
  change do
    create_table :cars do
      primary_key :id

      column :mark, String, null: false
      column :model, String, null: false
      foreign_key :user_id, :users
    end
  end
end
