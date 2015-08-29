class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :condition
      t.string :brand
      t.date :date_purchased
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
