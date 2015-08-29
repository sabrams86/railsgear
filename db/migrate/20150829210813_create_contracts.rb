class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :item_id
      t.integer :owner_id
      t.integer :renter_id
      t.date :start_date
      t.date :end_date
      t.string :status
    end
  end
end
