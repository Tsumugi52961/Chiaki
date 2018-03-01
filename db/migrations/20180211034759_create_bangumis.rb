Sequel.migration do
  change do
    create_table(:bangumis) do
      primary_key :id
      String :title, null: false
      String :uploaded_at
      String :classification
      String :link
      String :magnet_link, null: false
    end
  end
end

