class Item < ActiveRecord::Base
  belongs_to :user

  CONDITIONS = ["New", "Like New", "Fair", "Used and worn", "Old and worn", "Damaged"]
end
