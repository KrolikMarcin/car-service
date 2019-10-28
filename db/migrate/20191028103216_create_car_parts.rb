ROM::SQL.migration do
  change do
    create_table :car_parts do
      primary_key :id

      column :name, String, null: false
      column :mark, String, null: false
      column :price, Integer, null: false
    end
  end
end
