class Category < ActiveRecord::Base
  has_many :items, through: :categorizations

end
