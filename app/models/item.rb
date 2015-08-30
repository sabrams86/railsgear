class Item < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :contracts, dependent: :destroy
  accepts_nested_attributes_for :contracts
  dragonfly_accessor :image

  CONDITIONS = ["New", "Like New", "Fair", "Used and worn", "Old and worn", "Damaged"]
end
