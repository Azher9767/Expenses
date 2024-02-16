class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.jsonb :data

      t.timestamps
    end
  end
end
