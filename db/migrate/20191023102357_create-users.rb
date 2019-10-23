ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id

      column :email, String, null: false, unique: true, index: true
      column :name, String
    end
  end
end
