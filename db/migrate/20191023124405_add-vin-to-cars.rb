ROM::SQL.migration do
  change do
    alter_table :cars do
      add_column :vin, String, null: false
    end
  end
end
