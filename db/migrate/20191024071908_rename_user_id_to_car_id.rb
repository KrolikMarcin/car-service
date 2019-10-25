ROM::SQL.migration do
  change do
    alter_table(:services) do
      rename_column :user_id, :car_id
    end
  end
end
