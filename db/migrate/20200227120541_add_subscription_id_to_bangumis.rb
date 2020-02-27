class AddSubscriptionIdToBangumis < ActiveRecord::Migration[5.2]
  def change
    add_column :bangumis, :subscription_id, :integer
    add_column :bangumis, :category, :string
  end
end
