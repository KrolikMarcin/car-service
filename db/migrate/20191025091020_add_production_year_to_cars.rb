ROM::SQL.migration do
  change do
    alter_table :cars do
      add_column :production_year, Date, null: false
    end
  end
end
