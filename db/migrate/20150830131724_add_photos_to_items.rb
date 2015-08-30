class AddPhotosToItems < ActiveRecord::Migration
  def change
    add_column :items, :image_uid,  :string
    add_column :items, :image_name, :string
  end
end
