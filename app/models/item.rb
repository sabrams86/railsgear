class Item < ActiveRecord::Base
  belongs_to :user
  has_many :categories, through: :categorizations
  has_many :contracts, dependent: :destroy
  accepts_nested_attributes_for :contracts
  CONDITIONS = ["New", "Like New", "Fair", "Used and worn", "Old and worn", "Damaged"]
end
